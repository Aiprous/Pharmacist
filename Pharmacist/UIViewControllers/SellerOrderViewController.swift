//
//  SellerOrderViewController.swift
//  Pharmacist
//
//  Created by NCORD LLP on 08/10/18.
//  Copyright © 2018 Aiprous. All rights reserved.
//

import UIKit

class SellerOrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblSellerOrder: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false;
        
        self.tblSellerOrder.register(UINib(nibName: "SellerOrdersTableViewCell", bundle: nil), forCellReuseIdentifier: "SellerOrdersTableViewCell")
        tblSellerOrder.delegate = self
        tblSellerOrder.dataSource = self
        tblSellerOrder.estimatedRowHeight = 130
        tblSellerOrder.separatorStyle = .none
        
        let footerView = UIView()
        footerView.frame = CGRect(x: 0, y: 0, width: tblSellerOrder.frame.size.width, height: 1)
        footerView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        tblSellerOrder.tableFooterView = footerView
        
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Table View Delegate And DataSource
    
    func numberOfSections(in tableView: UITableView) -> Int{
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cellObj = tableView.dequeueReusableCell(withIdentifier: "SellerOrdersTableViewCell") as! SellerOrdersTableViewCell
        
        cellObj.lblOrderTotal.text = "\u{20B9}" + " 278.00"
        cellObj.btnViewDetails.tag = indexPath.row;
        cellObj.btnViewDetails.addTarget(self, action: #selector(btnViewDetailsAction(button:)), for: UIControlEvents.touchUpInside);
        cellObj.selectionStyle = .none
        return cellObj
    }
    
    //MARK: - tableview delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 258
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell:SellerOrdersTableViewCell = tableView.cellForRow(at: indexPath) as! SellerOrdersTableViewCell
        
        
        
    }
    
    @objc func btnViewDetailsAction(button: UIButton) {
        
        let Controller = kMainStoryboard.instantiateViewController(withIdentifier: kOrderDetailsProcessingItemsVC)
        self.navigationController?.pushViewController(Controller, animated: true)
       
        
    }

}
