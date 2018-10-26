//
//  AddDeliveryBoyViewController.swift
//  Pharmacist
//
//  Created by NCORD LLP on 08/10/18.
//  Copyright © 2018 Aiprous. All rights reserved.
//

import UIKit

class AddDeliveryBoyViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tblAddDeliveryBoy: UITableView!
    
    let arrayofText:NSArray = ["First name","Last name","Contact number 1", "Contact number 2", "Email ID","Address", "Address line 1"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Add Delivery Boy"
        // Register cell for tableview
        tblAddDeliveryBoy.register(UINib(nibName: "AddressTableViewCell", bundle: nil), forCellReuseIdentifier: "AddressTableViewCell")
        tblAddDeliveryBoy.estimatedRowHeight = 65
        tblAddDeliveryBoy.separatorStyle = .none
        
        let footerView = UIView()
        footerView.frame = CGRect(x: 0, y: 0, width: tblAddDeliveryBoy.frame.size.width, height: 1)
        footerView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        tblAddDeliveryBoy.tableFooterView = footerView
        
        //show navigationbar with back button
        self.setNavigationBackButtonOnly()
        self.navigationController?.isNavigationBarHidden = false;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK:- Table View Delegate And DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayofText.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cellObj = tableView.dequeueReusableCell(withIdentifier: "AddressTableViewCell") as! AddressTableViewCell
        cellObj.textField.text = ""
        cellObj.textField.placeholder = arrayofText[indexPath.row] as? String
        
        cellObj.selectionStyle = .none
        return cellObj
    }
    
    //MARK: - tableview delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 65
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    @IBAction func btnAddAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
