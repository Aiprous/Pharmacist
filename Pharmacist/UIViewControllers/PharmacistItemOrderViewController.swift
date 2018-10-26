//
//  PharmacistItemOrderViewController.swift
//  Pharmacist
//
//  Created by SBC on 09/10/18.
//  Copyright © 2018 Aiprous. All rights reserved.
//

import UIKit

class PharmacistItemOrderViewController: UIViewController {

    
    @IBOutlet weak var lblSubTotal: UILabel!
    
    @IBOutlet weak var lblShippingHandling: UILabel!
    
    @IBOutlet weak var lblDiscount: UILabel!
     @IBOutlet weak var lblPrice1: UILabel!
    @IBOutlet weak var lblPrice2: UILabel!

    @IBOutlet weak var lblTotalPrice: UILabel!
    @IBOutlet weak var lblFinalTotalPrice: UILabel!
    @IBOutlet weak var lblVendorTotalPrice: UILabel!
    @IBOutlet weak var lblSubTotalPrice: UILabel!
    @IBOutlet weak var lblTotalTax: UILabel!
    
    @IBOutlet weak var lblTotalOrderAmount: UILabel!
    
    @IBOutlet weak var lblAdminCommission: UILabel!
    
    @IBOutlet weak var lblTotalVendorAmount: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = false;
        self.lblSubTotal.text = "\u{20B9}" + " 108.00"
        self.lblShippingHandling.text = "\u{20B9}" + " 0.00"
        self.lblDiscount.text = "\u{20B9}" + " 0.00"
        self.lblTotalTax.text = "\u{20B9}" + " 8.00"
        self.lblTotalOrderAmount.text = "\u{20B9}" + " 108.00"
        
//        self.lblTotalPrice.text = "\u{20B9}" + " 278.00"
        self.lblTotalVendorAmount.text = "\u{20B9}" + " 108.00"
        self.lblAdminCommission.text = "\u{20B9}" + " 10.00"
        
        self.lblFinalTotalPrice.text = "\u{20B9}" + " 108.00"
        self.lblSubTotalPrice.text = "\u{20B9}" + " 108.00"
        self.lblVendorTotalPrice.text = "\u{20B9}" + " 108.00"
        self.lblTotalPrice.text = "\u{20B9}" + " 108.00"
        self.lblPrice1.text = "\u{20B9}" + " 108.00"
        self.lblPrice2.text = "\u{20B9}" + " 108.00"
        
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItemBackButton()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
