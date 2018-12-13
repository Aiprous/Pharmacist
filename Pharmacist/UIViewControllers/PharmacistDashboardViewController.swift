//
//  PharmacistDashboardViewController.swift
//  Pharmacist
//
//  Created by NCORD LLP on 09/10/18.
//  Copyright © 2018 Aiprous. All rights reserved.
//

import UIKit

class PharmacistDashboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var lblLifetimeSales: UILabel!
    @IBOutlet weak var lblRemainingAmount: UILabel!
    @IBOutlet weak var lblTotalPayout: UILabel!
    @IBOutlet weak var tblTopSellingProductsList: UITableView!
    @IBOutlet weak var barChart: BasicBarChart!
    @IBOutlet weak var btnYearly: DesignableButton!
    @IBOutlet weak var btnMonthly: DesignableButton!
    @IBOutlet weak var btnWeekly: DesignableButton!
    var days = [String]()
    var months = [String]()
    var year = [String]()
    var barChartStatus = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false;
        
        
        self.lblTotalPayout.text = "\u{20B9}" + " 2000.00"
        self.lblRemainingAmount.text = "\u{20B9}" + " 1000.00"
        self.lblLifetimeSales.text = "\u{20B9}" + " 125200.00"
        self.tblTopSellingProductsList.register(UINib(nibName: "TopSellingProductsTableViewCell", bundle: nil), forCellReuseIdentifier: "TopSellingProductsTableViewCell")
        tblTopSellingProductsList.delegate = self
        tblTopSellingProductsList.dataSource = self
        tblTopSellingProductsList.estimatedRowHeight = 130
//        tblTopSellingProductsList.separatorStyle = .none
        
        let footerView = UIView()
        footerView.frame = CGRect(x: 0, y: 0, width: tblTopSellingProductsList.frame.size.width, height: 1)
        footerView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        tblTopSellingProductsList.tableFooterView = footerView
        
        barChartStatus = "Weekly"
        days = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItem()
    }
    override func viewDidAppear(_ animated: Bool) {
        let dataEntries = generateDataEntries()
        barChart.dataEntries = dataEntries
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /// MARK: Chart
    
    @IBAction func btnYearlyAction(_ sender: Any) {
        
        self.btnYearly.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.1607843137, blue: 0.3098039216, alpha: 1)
        self.btnMonthly.backgroundColor = #colorLiteral(red: 1, green: 0.7803921569, blue: 0, alpha: 1)
        self.btnWeekly.backgroundColor = #colorLiteral(red: 1, green: 0.7803921569, blue: 0, alpha: 1)
        barChartStatus = "Yearly"
        year = ["2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018"]
        let dataEntries = generateDataEntries()
        barChart.dataEntries = dataEntries
    }
    
    @IBAction func btnMonthlyAction(_ sender: Any) {
        
        self.btnYearly.backgroundColor = #colorLiteral(red: 1, green: 0.7803921569, blue: 0, alpha: 1)
        self.btnMonthly.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.1607843137, blue: 0.3098039216, alpha: 1)
        self.btnWeekly.backgroundColor = #colorLiteral(red: 1, green: 0.7803921569, blue: 0, alpha: 1)
        barChartStatus = "Monthly"
        months = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"]
        let dataEntries = generateDataEntries()
        barChart.dataEntries = dataEntries
    }
    
    @IBAction func btnWeeklyAction(_ sender: Any) {
        
        self.btnYearly.backgroundColor = #colorLiteral(red: 1, green: 0.7803921569, blue: 0, alpha: 1)
        self.btnMonthly.backgroundColor = #colorLiteral(red: 1, green: 0.7803921569, blue: 0, alpha: 1)
        self.btnWeekly.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.1607843137, blue: 0.3098039216, alpha: 1)
        barChartStatus = "Weekly"
        days = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
        let dataEntries = generateDataEntries()
        barChart.dataEntries = dataEntries
        
    }
    
    /// MARK: Chart
    func generateDataEntries() -> [BarEntry] {
        
        let colors = [#colorLiteral(red: 0.1220000014, green: 0.172999993, blue: 0.2980000079, alpha: 1)]
        var result: [BarEntry] = []
        
        if(barChartStatus == "Yearly"){
            
            for i in 0..<year.count {
                let value = (arc4random() % 90) + 10
                let height: Float = Float(value) / 100.0
                result.append(BarEntry(color: colors[i % colors.count], height: height, textValue: "\(value)", title: year[i % year.count]))
            }
            
        }else if(barChartStatus == "Monthly"){
            
            for i in 0..<months.count {
                let value = (arc4random() % 90) + 10
                let height: Float = Float(value) / 100.0
                result.append(BarEntry(color: colors[i % colors.count], height: height, textValue: "\(value)", title: months[i % months.count]))
            }
            
        }else if(barChartStatus == "Weekly"){
            
            for i in 0..<days.count {
                let value = (arc4random() % 90) + 10
                let height: Float = Float(value) / 100.0
                result.append(BarEntry(color: colors[i % colors.count], height: height, textValue: "\(value)", title: days[i % days.count]))
            }
        }
        
        return result
    }
    
    //MARK:- Table View Delegate And DataSource
    
    func numberOfSections(in tableView: UITableView) -> Int{
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 4;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cellObj = tableView.dequeueReusableCell(withIdentifier: "TopSellingProductsTableViewCell") as! TopSellingProductsTableViewCell
        
        cellObj.selectionStyle = .none
        return cellObj
    }
    
    //MARK: - tableview delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 94
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell:TopSellingProductsTableViewCell = tableView.cellForRow(at: indexPath) as! TopSellingProductsTableViewCell
        
      
        
    }
    
    @IBAction func btnLatestOrdersAction(_ sender: Any) {
        
        
        let Controller = kMainStoryboard.instantiateViewController(withIdentifier: kSellerOrderVC)
        self.navigationController?.pushViewController(Controller, animated: true)
    }
    
    
}
