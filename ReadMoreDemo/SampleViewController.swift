//
//  SampleViewController.swift
//  ReadMoreDemo
//
//  Created by Dishant on 5/5/20.
//  Copyright © 2020 dishant. All rights reserved.
//

import UIKit

class SampleViewController: UIViewController,UITextViewDelegate {
    
    @IBOutlet weak var termsTableView: UITableView!
    var tempTextview : UITextView!

    let sampleVCViewModel = SampleVCViewModel()
    
    var arryTerms: [[String:String]] = []
    var showBI_And_LegalNotice = NSMutableAttributedString()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        showBI_And_LegalNotice = sampleVCViewModel.showBI_And_LegalNotice()
        
        arryTerms = [
                        ["orignalText":Constants.EnrollmentTerms.gps_Disclosure1,
                         "hyperLinkText":"velit esse cillum dolore eu fugiat nulla pariatu",
                         "url":Constants.EnrollmentTerms.gps_Disclosure1Link],
                        ["orignalText":Constants.EnrollmentTerms.gps_Disclosure2,
                        "hyperLinkText":"Duis aute irure dolor in reprehenderit",
                        "url":Constants.EnrollmentTerms.gps_Disclosure2Link],
                        ["orignalText":Constants.EnrollmentTerms.prospectus_Advice_Disclosure1,
                        "hyperLinkText":"",
                        "url":""],
                        ["orignalText":Constants.EnrollmentTerms.prospectus_Advice_Disclosure2,
                        "hyperLinkText":"",
                        "url":""],
                        ["orignalText":Constants.EnrollmentTerms.general_Disclosure,
                        "hyperLinkText":"",
                        "url":""]
                    ]
        self.termsTableView.reloadData()
    }
    
    private func prepareTextViewContent(isFullLegalotice: Bool){
        
        if isFullLegalotice {
           showBI_And_LegalNotice = sampleVCViewModel.showBI_And_LegalNoticeFull()
        }else {
           showBI_And_LegalNotice = sampleVCViewModel.showBI_And_LegalNotice()
        }
        self.termsTableView.reloadData()
    }
    
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
}


extension SampleViewController : UITableViewDelegate, UITableViewDataSource {

func numberOfSections(in tableView: UITableView) -> Int {
    
    return 1
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arryTerms.count + 1
}
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "EnrollmentTermsOfUseCell", for: indexPath) as? EnrollmentTermsOfUseCell else {
            fatalError("ReadyMadeInvestmentCell not found")
    }
    cell.termsDetailView.delegate = self
    
    //This one is static as we have to show always
    if indexPath.row == 0{

        cell.termsDetailView.attributedText = showBI_And_LegalNotice
    }
    else{
        
        cell.termsDetailView.attributedText = Utilities.addAttributedTextWithHyperLink(textContent: arryTerms[indexPath.row - 1]["orignalText"]!, customFont: UIFont(name: "SourceSansPro-Regular", size: 16)!, customColor: UIColor(red:0.2, green:0.22, blue:0.25, alpha:1), textRange: NSRange(location: 0, length: arryTerms[indexPath.row - 1]["orignalText"]!.count), textAlignment: NSTextAlignment.left, hyperLink: arryTerms[indexPath.row - 1]["hyperLinkText"]!, urlString: arryTerms[indexPath.row - 1]["url"]!)
        cell.termsDetailView.adjustsFontForContentSizeCategory = true
        
    }

    return cell
    
}

}

