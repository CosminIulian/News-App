//
//  SettingsPopupViewController.swift
//  News App
//
//  Created by Cosmin Iulian on 10/02/2020.
//  Copyright © 2020 Cosmin Iulian. All rights reserved.
//

import UIKit

class SettingsPopupViewController: UIViewController {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var countryPickerView: UIPickerView!
    @IBOutlet weak var categoryPickerView: UIPickerView!
    @IBOutlet weak var applyButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    var countryData: [String] = [String]()
    var categoryData: [String] = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyButton.addFloatingAndRoundedStyle()
        cancelButton.addFloatingAndRoundedStyle()
        cardView.addShadowAndRoundedCorners()
        
        countryLabel.addDropShadow()
        countryLabel.font = UIFont(name: Theme.bodyFontNameBold, size: 18)
        countryLabel.textColor = Theme.tint
        
        categoryLabel.addDropShadow()
        categoryLabel.font = UIFont(name: Theme.bodyFontNameBold, size: 18)
        categoryLabel.textColor = Theme.tint
        
        countryPickerView.delegate = self
        countryPickerView.dataSource = self
        countryPickerView.setValue(Theme.background, forKeyPath: "textColor")
        
        categoryPickerView.delegate = self
        categoryPickerView.dataSource = self
        categoryPickerView.setValue(Theme.background, forKeyPath: "textColor")
        
        countryData = CountryEnum.countryList // list of country(strings)
        categoryData = CategoryEnum.categoryList // list of category(strings)
    }
    
    
    // Apply Button Action after unwind to ArticleList
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destVC = segue.destination as! ArticleListViewController
        destVC.currentCountry = countryData[countryPickerView.selectedRow(inComponent: 0)]
        destVC.currentCategory = categoryData[categoryPickerView.selectedRow(inComponent: 0)]
    }
    
    
    // Cancel Button Action
    @IBAction func cancelButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}

extension SettingsPopupViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 1 {
            return countryData.count
        }
        else {
            return categoryData.count
        }
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 1 {
            return countryData[row]
        }
        else{
            return categoryData[row]
        }
    }
    
}
