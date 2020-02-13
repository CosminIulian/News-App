//
//  ArticleDetailsViewController.swift
//  News App
//
//  Created by Cosmin Iulian on 10/02/2020.
//  Copyright © 2020 Cosmin Iulian. All rights reserved.
//

import UIKit
import SafariServices

class ArticleDetailsViewController: UIViewController {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var publishedAtLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var urlButton: UIButton!
    
    var articleModel: Article?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Theme.background
        cardView.backgroundColor = Theme.accent
        photoImageView.backgroundColor = Theme.accent
        
        titleLabel.font = UIFont(name: Theme.bodyFontNameBold, size: 20)
        titleLabel.textColor = Theme.background
        
        urlButton.titleLabel?.font =  UIFont(name: Theme.bodyFontNameDemiBold, size: 18)
        
        authorLabel.font = UIFont(name: Theme.bodyFontName, size: 15)
        authorLabel.textColor = Theme.background
        
        publishedAtLabel.font = UIFont(name: Theme.bodyFontName, size: 15)
        publishedAtLabel.textColor = Theme.background
        
        textView.font = UIFont(name: Theme.bodyFontNameDemiBold, size: 18)
        textView.textColor = Theme.background
        
        // set the same shadow and rounded corners to cardView & photoImageView
        cardView.addShadowAndRoundedCorners()
        photoImageView.layer.cornerRadius = cardView.layer.cornerRadius
        
        setup()
    }
    
    
    private func setup() {
        
        // Set the image
        if articleModel?.urlToImage != nil {
            let url = URL(string: (articleModel?.urlToImage!)!)
            
            // if the url it's wrong
            if url != nil {
                photoImageView.load(url: url!) // set the image
            }
        }
        
        // Set the title label
        titleLabel.text = articleModel?.title
        
        // Set the author label
        authorLabel.text = articleModel?.author
        
        // Set the publishedAt label
        if articleModel?.publishedAt !=  nil && articleModel?.publishedAt != "" {
            let dateString: String  = (articleModel?.publishedAt!)!
            
            let dateEndIndex = dateString.firstIndex(of: "T") ?? dateString.endIndex
            let date = dateString[..<dateEndIndex]
            
            let start = dateString.index(dateEndIndex, offsetBy: 1)
            let end = dateString.index(dateString.endIndex, offsetBy: -4)
            let range = start..<end
            let hour = dateString[range]
            
            publishedAtLabel.text = String(date) + " , " + String(hour)
        }
        
        if articleModel?.description != nil && articleModel?.description != "" {
            // Set the description value
            textView.text = articleModel?.description
        }
        else // if the description value is empty then
            if articleModel?.content != nil &&  articleModel?.content != "" {
                // Set the content without html tags
                let stringWithoutHtmlTags = articleModel?.content
                textView.text = stringWithoutHtmlTags?.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)// set the content value
            } else {
                textView.text = "No description"
        }
        
    }
    
    // Url Button Action
    @IBAction func urlButtonAction(_ sender: UIButton) {
        
        showSafariVC(for: articleModel?.url)
    }
    
    // Show in Safari Browser
    func showSafariVC(for url: String?) {
        guard let url = URL(string: (url)!) else {
            // Show an invalid URL error alert
            print("invalid URL : Safari")
            return
        }
        
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
    
    
}
