//
//  UITExtViewExtension.swift
//  ReadMoreDemo
//
//  Created by Dishant on 5/6/20.
//  Copyright © 2020 dishant. All rights reserved.
//

import Foundation
import UIKit

extension UITextView {

  func addHyperLinksToText(originalText: String, hyperLinks: [String: String]) {
    let style = NSMutableParagraphStyle()
    style.alignment = .left
    let attributedOriginalText = NSMutableAttributedString(string: originalText)
    for (hyperLink, urlString) in hyperLinks {
        let linkRange = attributedOriginalText.mutableString.range(of: hyperLink)
        let fullRange = NSRange(location: 0, length: attributedOriginalText.length)
        attributedOriginalText.addAttribute(NSAttributedString.Key.link, value: urlString, range: linkRange)
        attributedOriginalText.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: fullRange)
        attributedOriginalText.addAttribute(NSAttributedString.Key.font, value: "SourceSansPro-Regular", range: fullRange)
    }

    self.linkTextAttributes = [
        NSAttributedString.Key.foregroundColor: UIColor.blue,
        NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
    ]
    self.attributedText = attributedOriginalText
  }
}

extension NSUnderlineStyle {

    static var patternLargeDot: NSUnderlineStyle {
        return NSUnderlineStyle(rawValue: 0x11)
    }
    
}

struct Utilities {
    
   static func addAttributedText(textContent:String, customFont:UIFont, customColor:UIColor, textRange:NSRange, textAlignment:NSTextAlignment) -> NSMutableAttributedString{
        
        let textContent = textContent
        let textString = NSMutableAttributedString(string: textContent, attributes: [NSAttributedString.Key.font: customFont])
        textString.addAttribute(NSAttributedString.Key.foregroundColor , value: customColor, range: textRange)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 1.5
        paragraphStyle.alignment = textAlignment
        textString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range: textRange)
        textString.addAttribute(NSAttributedString.Key.kern, value: 0, range: textRange)
        
        return textString
    }
    
    static func addAttributedTextWithHyperLink(textContent:String, customFont:UIFont, customColor:UIColor, textRange:NSRange, textAlignment:NSTextAlignment,hyperLink: String, urlString: String) -> NSMutableAttributedString{
         
         let textContent = textContent
         let textString = NSMutableAttributedString(string: textContent, attributes: [NSAttributedString.Key.font: customFont])
         textString.addAttribute(NSAttributedString.Key.foregroundColor , value: customColor, range: textRange)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 1.5
        paragraphStyle.alignment = textAlignment
        
        if (hyperLink.count > 0 && urlString.count > 0){
            let linkRange = textString.mutableString.range(of: hyperLink)
                textString.addAttribute(NSAttributedString.Key.link, value: urlString, range: linkRange)
        }
        
         textString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range: textRange)
         textString.addAttribute(NSAttributedString.Key.kern, value: 0, range: textRange)
         
         return textString
     }
    
    
    //MARK:-prepare bullet text
  static func addBulletSymbol(stringList: [String],
             font: UIFont,
             bullet: String = "●",
             indentation: CGFloat = 20,
             lineSpacing: CGFloat = 2,
             paragraphSpacing: CGFloat = 12,
             textColor: UIColor = UIColor(red:0.2, green:0.22, blue:0.25, alpha:1),
             bulletColor: UIColor = .black) -> NSAttributedString {

        let textAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: textColor]
        let bulletAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: bulletColor]

        let paragraphStyle = NSMutableParagraphStyle()
        let nonOptions = [NSTextTab.OptionKey: Any]()
        paragraphStyle.tabStops = [
            NSTextTab(textAlignment: .left, location: indentation, options: nonOptions)]
        paragraphStyle.defaultTabInterval = indentation
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.paragraphSpacing = paragraphSpacing
        paragraphStyle.headIndent = indentation

        let bulletList = NSMutableAttributedString()
        for string in stringList {
            let formattedString = "\(bullet)\t\(string)\n"
            let attributedString = NSMutableAttributedString(string: formattedString)

            attributedString.addAttributes(
                [NSAttributedString.Key.paragraphStyle : paragraphStyle],
                range: NSMakeRange(0, attributedString.length))

            attributedString.addAttributes(
                textAttributes,
                range: NSMakeRange(0, attributedString.length))

            let string:NSString = NSString(string: formattedString)
            let rangeForBullet:NSRange = string.range(of: bullet)
            attributedString.addAttributes(bulletAttributes, range: rangeForBullet)
            bulletList.append(attributedString)
        }

        return bulletList
    }
    
    
    
}

class AnchoredTextTab : NSTextTab {
    weak var textContainer : NSTextContainer!

    required init(textAlignment alignment: NSTextAlignment, location loc: CGFloat, options: [NSTextTab.OptionKey  : AnyObject], textContainer aTextContainer : NSTextContainer) {
        super.init(textAlignment: alignment, location: loc, options: options)
        textContainer = aTextContainer
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override var location: CGFloat {
        get {
           return textContainer.size.width-textContainer.lineFragmentPadding*2
        }
    }
}
