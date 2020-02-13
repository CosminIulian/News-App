//
//  ArticleListViewController.swift
//  News App
//
//  Created by Cosmin Iulian on 09/02/2020.
//  Copyright © 2020 Cosmin Iulian. All rights reserved.
//

import UIKit

class ArticleListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var articleList: [Article]?
    public var currentCountry: String!
    public var currentCategory: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        currentCountry = "Romania"
        currentCategory = "general"
        let urlString = FetchData().setUrlForTopHeadlines(country: .RO, category: .general)
        getRequest(urlString) // the default is set to region = RO & category = general
    }
    
    
    // MARK: Make a get request by urlString
    public func getRequest(_ urlString: String) {
        
        // Create the URL from urlString
        let url = URL(string: urlString)
        guard url != nil else {
            print("The url is nil")
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            // Check for errors
            if error == nil  && data != nil {
                // Parse JSON
                let decoder = JSONDecoder()
                
                do{
                    let newsFeed = try decoder.decode(NewsFeed.self, from: data!)
                    
                    //print("STATUS: " + newsFeed.status)                       //   prints the status
                    //print("TOTAL RESULTS: " + String(newsFeed.totalResults)) //       and totalResults for testing
                    
                    DispatchQueue.main.async {
                        self.articleList = newsFeed.articles
                        self.tableView.reloadData()
                    }
                    
                }catch{
                    print("Error JSON Decoder")
                }
                
            }
        }
        // Make the API call
        dataTask.resume()
    }
    
    
    @IBAction func unwindToArticleList(_ sender: UIStoryboardSegue) {
        
        let urlString = FetchData().setUrlForTopHeadlines(country: CountryEnum(rawValue: currentCountry)!, category: CategoryEnum(rawValue: currentCategory)!)
        getRequest(urlString)
    }
    
    
}


// MARK: TABLE VIEW METHODS
extension ArticleListViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    // the number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return articleList?.count ?? 0
    }
    
    
    // the content of cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.Identifier) as! ArticleTableViewCell // for optimize I use
        // dequeueReusableCell
        
        // check if it's nil
        if articleList?[indexPath.row] != nil {
            cell.setup(articleModel: (articleList?[indexPath.row])!)
            
            return cell
        }
        return UITableViewCell() // if articleList it's nil
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 180 // the heigth of the row
    }
    
    
    /* row selected function */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //extract the current article
        let article = articleList?[indexPath.row]
        
        /* Navigate to ArticleDetailsViewController */
        let vc = ArticleDetailsViewController.getInstance() as! ArticleDetailsViewController
        vc.articleModel = article
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
