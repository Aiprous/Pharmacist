//
//  PharmacistOrderDetailsViewController.swift
//  Pharmacist
//
//  Created by NCORD LLP on 08/10/18.
//  Copyright © 2018 Aiprous. All rights reserved.
//

import UIKit

class PharmacistOrderDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItemBackButton()
    }
   
}
