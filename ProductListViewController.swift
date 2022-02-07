//
//  ProductListViewController.swift
//  Demo09 ShoppingListWithSeverLogin
//
//  Created by LukeLin on 2022/1/29.
//

import UIKit
import Foundation

class ProductListViewController: UIViewController {

    @IBOutlet var productpicture: [UIImageView]!
    @IBOutlet var productnameLabel: [UILabel]!
    @IBOutlet var productpriceLabel: [UILabel]!
    @IBOutlet var steppervalueLabel: [UILabel]!
    @IBOutlet var stepper01: UIStepper!
    @IBOutlet var stepper02: UIStepper!
    @IBOutlet var stepper03: UIStepper!
    @IBOutlet var totalpriceLabel: UILabel!
    

    
    let productpictureArray = ["iphone13pro", "Airpodspro", "airpods-max"]
    
    let productnameArray = ["IPhone13 Pro", "Airpods Pro", "Airpods Max"]
    
    let productprice = ["32900", "7990", "18490"]
    
    var pictrueindex = 0
    var nameLabelindex = 0
    var priceLabelindex = 0
    
    
    
    @IBAction func steppertap () {
        
        let productprice1 = Int(productprice[0])!
        let productprice2 = Int(productprice[1])!
        let productprice3 = Int(productprice[2])!
        
        let price1 = Int(stepper01.value) * productprice1
        let price2 = Int(stepper02.value) * productprice2
        let price3 = Int(stepper03.value) * productprice3
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyISOCode
        formatter.maximumFractionDigits = 0
        formatter.locale = Locale(identifier: "zh_TW")
        
        steppervalueLabel[0].text = String(Int(stepper01.value))
        steppervalueLabel[1].text = String(Int(stepper02.value))
        steppervalueLabel[2].text = String(Int(stepper03.value))
        
       
        
        
        let totalprice = price1 + price2 + price3
        let currencystylemoney = formatter.string(from: NSNumber(value: totalprice))
        
        totalpriceLabel.text = "Total : \((currencystylemoney)!)"
        
    }
    
    @IBAction func restartButtonpress() {
        totalpriceLabel.text = "Total : "
        stepper01.value = 0
        stepper02.value = 0
        stepper03.value = 0
        for number in steppervalueLabel {
            number.text = "0"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for pictrue in productpicture {
            pictrue.image = UIImage(named: productpictureArray[pictrueindex])
            pictrueindex += 1
        }
        
        for name in productnameLabel {
            name.text = productnameArray[nameLabelindex]
            nameLabelindex += 1
        }
        
        for price in productpriceLabel {
            price.text = productprice[priceLabelindex]
            priceLabelindex += 1
        }
        
        for number in steppervalueLabel {
            number.text = "0"
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyISOCode
        formatter.maximumFractionDigits = 0
        formatter.locale = Locale(identifier: "zh_TW")
        
        let price1 = 32900
        let price2 = 7990
        let price3 = 18490
        
        productpriceLabel[0].text = formatter.string(from: NSNumber(value: price1))!
        productpriceLabel[1].text = formatter.string(from: NSNumber(value: price2))!
        productpriceLabel[2].text = formatter.string(from: NSNumber(value: price3))!

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
