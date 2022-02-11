//
//  SampleVCViewModel.swift
//  ReadMoreDemo
//
//  Created by Dishant on 5/7/20.
//  Copyright © 2020 dishant. All rights reserved.
//

import Foundation
import UIKit

class SampleVCViewModel {
    
    public func showBI_And_LegalNotice() -> NSMutableAttributedString{

        let textString  = NSMutableAttributedString()
        textString.append(self.articleHeader())
        textString.append(self.view_Reg_BI_Disclosure())
        textString.append(self.legalNotice())
        
        return textString
    }
    
    public func showBI_And_LegalNoticeFull() -> NSMutableAttributedString{

        let textString  = NSMutableAttributedString()
        textString.append(self.articleHeader())
        textString.append(self.view_Reg_BI_Disclosure())
        textString.append(self.fullLegalNotice())
        
        return textString
    }
    
    private func articleHeader() -> NSAttributedString{
        
        let textContent = Constants.EnrollmentTerms.mainTitle
//        let textString  = Utilities.addAttributedText(textContent: textContent, customFont: UIFont(name: "SourceSansPro-Bold", size: 22)!, customColor: UIColor(red:0, green:0.09, blue:0.44, alpha:1), textRange: NSRange(location: 0, length: textContent.count), textAlignment: NSTextAlignment.center)
        
        let textString  = Utilities.addAttributedTextWithHyperLink(textContent: textContent, customFont: UIFont(name: "SourceSansPro-Bold", size: 22)!, customColor: UIColor(red:0, green:0.09, blue:0.44, alpha:1), textRange: NSRange(location: 0, length: textContent.count), textAlignment: NSTextAlignment.center, hyperLink: "", urlString: "")
        return textString
    }
    
    private func view_Reg_BI_Disclosure() -> NSAttributedString{
        
        let textContent = Constants.EnrollmentTerms.reg_BI_Disclosure
        let textString  = Utilities.addAttributedTextWithHyperLink(textContent: textContent, customFont: UIFont(name: "SourceSansPro-Regular", size: 16)!, customColor: UIColor(red:0.2, green:0.22, blue:0.25, alpha:1), textRange: NSRange(location: 0, length: textContent.count), textAlignment: NSTextAlignment.left, hyperLink: "Open link in safari", urlString: Constants.EnrollmentTerms.swiftLink)
        
        return textString
    }
    
    private func legalNotice() -> NSAttributedString{
        
        let titleText = Constants.EnrollmentTerms.legalNoticeTitle
        let textContent = Constants.EnrollmentTerms.legalNoticeLess
        
        let textString  = Utilities.addAttributedTextWithHyperLink(textContent: titleText, customFont: UIFont(name: "SourceSansPro-Semibold", size: 16)!, customColor: UIColor(red:0.2, green:0.22, blue:0.25, alpha:1), textRange: NSRange(location: 0, length: titleText.count), textAlignment: NSTextAlignment.left, hyperLink: "", urlString: "")
                
        let bodyTextString  = Utilities.addAttributedTextWithHyperLink(textContent: textContent, customFont: UIFont(name: "SourceSansPro-Regular", size: 16)!, customColor: UIColor(red:0.2, green:0.22, blue:0.25, alpha:1), textRange: NSRange(location: 0, length: textContent.count), textAlignment: NSTextAlignment.left, hyperLink: "Read full", urlString: Constants.EnrollmentTerms.expandLegalNotice)
        
        textString.append(bodyTextString)
        
        return textString
    }
    
    private func fullLegalNotice() -> NSAttributedString{

        let titleText = Constants.EnrollmentTerms.legalNoticeTitle
        let textContent = Constants.EnrollmentTerms.legalNoticeFull_Part1
        let bulletPointString = Constants.EnrollmentTerms.legalNoticeFull_Part2

        let textString  = Utilities.addAttributedTextWithHyperLink(textContent: titleText, customFont: UIFont(name: "SourceSansPro-Semibold", size: 16)!, customColor: UIColor(red:0.2, green:0.22, blue:0.25, alpha:1), textRange: NSRange(location: 0, length: titleText.count), textAlignment: NSTextAlignment.left, hyperLink: "", urlString: "")
            
        let bodyTextString  = Utilities.addAttributedTextWithHyperLink(textContent: textContent, customFont: UIFont(name: "SourceSansPro-Regular", size: 16)!, customColor: UIColor(red:0.2, green:0.22, blue:0.25, alpha:1), textRange: NSRange(location: 0, length: textContent.count), textAlignment: NSTextAlignment.left, hyperLink: "", urlString: "")
            
            textString.append(bodyTextString)
            textString.append(Utilities.addBulletSymbol(stringList: bulletPointString, font: UIFont(name: "SourceSansPro-Regular", size: 16)!))

            textString.append(legalNoticeUpdateEmailAddress())
            textString.append(additionalTerms())
            textString.append(additionalInfo())
            textString.append(disclaimerInfo())
            //textString.append(addSeparatorLine())
            return textString
    }
    
    private func legalNoticeUpdateEmailAddress() -> NSAttributedString {
        
        let textContent = Constants.EnrollmentTerms.legalNoticeUpdateEmailAddress
        let textString  = Utilities.addAttributedTextWithHyperLink(textContent: textContent, customFont: UIFont(name: "SourceSansPro-It", size: 16)!, customColor: UIColor(red:0.2, green:0.22, blue:0.25, alpha:1), textRange: NSRange(location: 0, length: textContent.count), textAlignment: NSTextAlignment.left, hyperLink: "", urlString: "")
        
        return textString
    }
    
    private func additionalTerms()-> NSAttributedString{
        
        let textContent = Constants.EnrollmentTerms.additionalTerms_Part1
        let bulletPointsString = Constants.EnrollmentTerms.additionalTerms_Part2
        
        let textString  = Utilities.addAttributedTextWithHyperLink(textContent: textContent, customFont: UIFont(name: "SourceSansPro-Semibold", size: 16)!, customColor: UIColor(red:0.2, green:0.22, blue:0.25, alpha:1), textRange: NSRange(location: 0, length: textContent.count), textAlignment: NSTextAlignment.left, hyperLink: "", urlString: "")

       textString.addAttribute(NSAttributedString.Key.underlineStyle , value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: textContent.count))

        textString.append(Utilities.addBulletSymbol(stringList: bulletPointsString, font: UIFont(name: "SourceSansPro-Regular", size: 16)!))
        return textString
    }
    
    private func additionalInfo() -> NSAttributedString {
        
        let textContent = Constants.EnrollmentTerms.additionalInfo
        
        let textString  = Utilities.addAttributedTextWithHyperLink(textContent: textContent, customFont: UIFont(name: "SourceSansPro-Regular", size: 16)!, customColor: UIColor(red:0.2, green:0.22, blue:0.25, alpha:1), textRange: NSRange(location: 0, length: textContent.count), textAlignment: NSTextAlignment.left, hyperLink: "", urlString: "")
        
        return textString
    }
    
    private func disclaimerInfo() -> NSAttributedString {
        
        let textContent = Constants.EnrollmentTerms.disclaimerInfo
        
        let textString  = Utilities.addAttributedTextWithHyperLink(textContent: textContent, customFont: UIFont(name: "SourceSansPro-It", size: 16)!, customColor: UIColor(red:0.2, green:0.22, blue:0.25, alpha:1), textRange: NSRange(location: 0, length: textContent.count), textAlignment: NSTextAlignment.left, hyperLink: "Read less", urlString: Constants.EnrollmentTerms.closeLegalNotice)
        
        return textString
    }
}
