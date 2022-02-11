//
//  ViewController.swift
//  ReadMoreDemo
//
//  Created by Dishant on 5/5/20.
//  Copyright © 2020 dishant. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var btnAccept: UIButton!
    @IBOutlet weak var termsAndConditionTextView: UITextView!
    
    
    let showGetStartedSecurityProfileSegueIdentifier = "GetStartedSecurityProfileVC"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
 
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        prepareTextViewContent(isFullLegalotice: false)
    }
    
    private func setupUI(){
        
    }
    
    private func prepareTextViewContent(isFullLegalotice: Bool){
        let termsOfUsesText = NSMutableAttributedString()

        termsOfUsesText.append(articleHeader())
        termsOfUsesText.append(view_Reg_BI_Disclosure())
        
        if isFullLegalotice {
            termsOfUsesText.append(fullLegalNotice())
        }else {
            termsOfUsesText.append(legalNotice())
        }
        
        termsOfUsesText.append(disclosureOne())
        termsOfUsesText.append(disclosureTwo())
        termsOfUsesText.append(disclosureThree())
        termsAndConditionTextView.delegate = self
        termsAndConditionTextView.attributedText = termsOfUsesText
        
        
        // Set how links should appear: blue and underlined
//        self.termsAndConditionTextView.linkTextAttributes = [
//            .foregroundColor: UIColor.init(hexString: "#1352DE")
//        ]
        
        termsAndConditionTextView.isUserInteractionEnabled = true
        termsAndConditionTextView.isEditable = false
        termsAndConditionTextView.isSelectable = true
        termsAndConditionTextView.dataDetectorTypes = [.link, .phoneNumber]
    }
    // MARK:- Button actions
       
   @objc func cancelButtonTapped(_ sender: UIButton) {
       self.navigationController?.popToRootViewController(animated: true)
   }
    
   @IBAction func acceptButtonClicked(_ sender: Any) {
        
        //TODO:Accept buttion action
    
    }
    
    //MARK:- UITextView Data
    
    private func articleHeader() -> NSAttributedString{
        
        let textContent = Constants.EnrollmentTerms.mainTitle
        let textString  = Utilities.addAttributedText(textContent: textContent, customFont: UIFont(name: "SourceSansPro-Bold", size: 22)!, customColor: UIColor(red:0, green:0.09, blue:0.44, alpha:1), textRange: NSRange(location: 0, length: textContent.count), textAlignment: NSTextAlignment.center)
        
        return textString
    }
    
    private func view_Reg_BI_Disclosure() -> NSAttributedString{
        
        let textContent = Constants.EnrollmentTerms.reg_BI_Disclosure
        let textString  = Utilities.addAttributedText(textContent: textContent, customFont: UIFont(name: "SourceSansPro-Regular", size: 16)!, customColor: UIColor(red:0.2, green:0.22, blue:0.25, alpha:1), textRange: NSRange(location: 0, length: textContent.count), textAlignment: NSTextAlignment.left)
        
        let url = URL(string: "https://www.swift.org/")!
        
        // Set the 'click here' substring to be the link
        let linkFont = UIFont(name: "SourceSansPro-Regular", size: 16.0)
        textString.setAttributes([.link: url, .font: linkFont!], range:  NSMakeRange(textString.length - 28, 27))
        return textString
    }
    
    private func legalNotice() -> NSAttributedString{
        
        let titleText = Constants.EnrollmentTerms.legalNoticeTitle
        let textContent = Constants.EnrollmentTerms.legalNoticeLess
        
        let textString  = Utilities.addAttributedText(textContent: titleText, customFont: UIFont(name: "SourceSansPro-Semibold", size: 16)!, customColor: UIColor(red:0.2, green:0.22, blue:0.25, alpha:1), textRange: NSRange(location: 0, length: titleText.count), textAlignment: NSTextAlignment.left)
        
        let bodyTextString  = Utilities.addAttributedText(textContent: textContent, customFont: UIFont(name: "SourceSansPro-Regular", size: 16)!, customColor: UIColor(red:0.2, green:0.22, blue:0.25, alpha:1), textRange: NSRange(location: 0, length: textContent.count), textAlignment: NSTextAlignment.left)
        
        textString.append(bodyTextString)
        
        let url = URL(string: Constants.EnrollmentTerms.expandLegalNotice)!

        // Set the 'click here' substring to be the link
        let linkFont = UIFont(name: "SourceSansPro-Regular", size: 16.0)
        textString.setAttributes([.link: url, .font: linkFont!], range: NSMakeRange(textString.length - 26, 25))
        textString.append(addSeparatorLine())
        return textString
    }
    
    private func fullLegalNotice() -> NSAttributedString{

        let titleText = Constants.EnrollmentTerms.legalNoticeTitle
        let textContent = Constants.EnrollmentTerms.legalNoticeFull_Part1
        let bulletPointString = Constants.EnrollmentTerms.legalNoticeFull_Part2

        let textString  = Utilities.addAttributedText(textContent: titleText, customFont: UIFont(name: "SourceSansPro-Semibold", size: 16)!, customColor: UIColor(red:0.2, green:0.22, blue:0.25, alpha:1), textRange: NSRange(location: 0, length: titleText.count), textAlignment: NSTextAlignment.left)
            
        let bodyTextString  = Utilities.addAttributedText(textContent: textContent, customFont: UIFont(name: "SourceSansPro-Regular", size: 16)!, customColor: UIColor(red:0.2, green:0.22, blue:0.25, alpha:1), textRange: NSRange(location: 0, length: textContent.count), textAlignment: NSTextAlignment.left)
            
            textString.append(bodyTextString)
            textString.append(Utilities.addBulletSymbol(stringList: bulletPointString, font: UIFont(name: "SourceSansPro-Regular", size: 16)!))

            textString.append(legalNoticeUpdateEmailAddress())
            textString.append(additionalTerms())
            textString.append(additionalInfo())
            textString.append(disclaimerInfo())
            textString.append(addSeparatorLine())
            return textString
    }
    
    private func legalNoticeUpdateEmailAddress() -> NSAttributedString {
        
        let textContent = Constants.EnrollmentTerms.legalNoticeUpdateEmailAddress
        let textString  = Utilities.addAttributedText(textContent: textContent, customFont: UIFont(name: "SourceSansPro-It", size: 16)!, customColor: UIColor(red:0.2, green:0.22, blue:0.25, alpha:1), textRange: NSRange(location: 0, length: textContent.count), textAlignment: NSTextAlignment.left)
        
        return textString
    }
    
    private func additionalTerms()-> NSAttributedString{
        
        let textContent = Constants.EnrollmentTerms.additionalTerms_Part1
        let bulletPointsString = Constants.EnrollmentTerms.additionalTerms_Part2
        
        let textString  = Utilities.addAttributedText(textContent: textContent, customFont: UIFont(name: "SourceSansPro-Semibold", size: 16)!, customColor: UIColor(red:0.2, green:0.22, blue:0.25, alpha:1), textRange: NSRange(location: 0, length: textContent.count), textAlignment: NSTextAlignment.left)

       textString.addAttribute(NSAttributedString.Key.underlineStyle , value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: textContent.count))

        textString.append(Utilities.addBulletSymbol(stringList: bulletPointsString, font: UIFont(name: "SourceSansPro-Regular", size: 16)!))
        return textString
    }
    
    private func additionalInfo() -> NSAttributedString {
        
        let textContent = Constants.EnrollmentTerms.additionalInfo
        
        let textString  = Utilities.addAttributedText(textContent: textContent, customFont: UIFont(name: "SourceSansPro-Regular", size: 16)!, customColor: UIColor(red:0.2, green:0.22, blue:0.25, alpha:1), textRange: NSRange(location: 0, length: textContent.count), textAlignment: NSTextAlignment.left)
        
        return textString
    }
    
    private func disclaimerInfo() -> NSAttributedString {
        
        let textContent = Constants.EnrollmentTerms.disclaimerInfo
        
        let textString  = Utilities.addAttributedText(textContent: textContent, customFont: UIFont(name: "SourceSansPro-It", size: 16)!, customColor: UIColor(red:0.2, green:0.22, blue:0.25, alpha:1), textRange: NSRange(location: 0, length: textContent.count), textAlignment: NSTextAlignment.left)
        
        let url = URL(string: Constants.EnrollmentTerms.closeLegalNotice)!

        // Set the 'click here' substring to be the link
        let linkFont = UIFont(name: "SourceSansPro-Regular", size: 16.0)
        textString.setAttributes([.link: url, .font: linkFont!], range: NSMakeRange(textString.length - 9, 9))
        
        return textString
    }
    
    private func disclosureOne() -> NSAttributedString{
        
        let textContent = Constants.EnrollmentTerms.prospectus_Advice_Disclosure1
        
        let textString  = Utilities.addAttributedText(textContent: textContent, customFont: UIFont(name: "SourceSansPro-Regular", size: 16)!, customColor: UIColor(red:0.2, green:0.22, blue:0.25, alpha:1), textRange: NSRange(location: 0, length: textContent.count), textAlignment: NSTextAlignment.left)
        
        textString.append(addSeparatorLine())
        return textString
    }
    
    private func disclosureTwo() -> NSAttributedString{
        
        let textContent = Constants.EnrollmentTerms.prospectus_Advice_Disclosure2
        
        let textString  = Utilities.addAttributedText(textContent: textContent, customFont: UIFont(name: "SourceSansPro-Regular", size: 16)!, customColor: UIColor(red:0.2, green:0.22, blue:0.25, alpha:1), textRange: NSRange(location: 0, length: textContent.count), textAlignment: NSTextAlignment.left)
        
        textString.append(addSeparatorLine())
        return textString
    }
    
    private func disclosureThree() -> NSAttributedString{
        
        let textContent = Constants.EnrollmentTerms.general_Disclosure
        
        let textString  = Utilities.addAttributedText(textContent: textContent, customFont: UIFont(name: "SourceSansPro-Regular", size: 16)!, customColor: UIColor(red:0.2, green:0.22, blue:0.25, alpha:1), textRange: NSRange(location: 0, length: textContent.count), textAlignment: NSTextAlignment.left)
              
        textString.append(addSeparatorLine())
        return textString
    }
    
    //MARK:- UItextView
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        print("#######Link FOUND#########")
        //we will identify the URL and redirect accordingly in below snippet

        if(URL.absoluteString == Constants.EnrollmentTerms.expandLegalNotice){
            prepareTextViewContent(isFullLegalotice: true)
        }else if(URL.absoluteString == Constants.EnrollmentTerms.closeLegalNotice){
            prepareTextViewContent(isFullLegalotice: false)
        }
        else {
            UIApplication.shared.open(URL) { (Bool) in

            }
        }
        return false
    }
    
    func addSeparatorLine(indent : CGFloat = 0, width : CGFloat = 1) -> NSAttributedString
    {
        let paragraphStyle = NSMutableParagraphStyle()

        paragraphStyle.tabStops = []
        paragraphStyle.addTabStop(NSTextTab(textAlignment: .left, location: indent, options: [:]))
        paragraphStyle.addTabStop(AnchoredTextTab(textAlignment: .right, location: indent, options: [:], textContainer : termsAndConditionTextView.textContainer))
        paragraphStyle.alignment = .left

        let attributes = [NSAttributedString.Key.paragraphStyle : paragraphStyle, NSAttributedString.Key.strikethroughStyle : width, NSAttributedString.Key.foregroundColor : UIColor(red:0.88, green:0.9, blue:0.92, alpha:1)] as [NSAttributedString.Key : Any]

        let ZeroWidthNonBreakingSpace = "\u{FEFF}"
        return  NSAttributedString(string: "\n\n\(ZeroWidthNonBreakingSpace)\t\(ZeroWidthNonBreakingSpace)\t\(ZeroWidthNonBreakingSpace)\n", attributes:  attributes)
    }
}



