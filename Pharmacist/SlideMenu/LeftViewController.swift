//
//  LeftViewController.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 12/3/14.
//

import UIKit

enum LeftMenu: Int {
    case home = 0
    case orders
    case profile
    case products
    case notifications
    case addDeliveryBoy
    case transaction
    case logout
}

struct Section {
    var name: String!
    var items: [String]!
    var collapsed: Bool!
    
    
    init(name: String, items: [String], collapsed: Bool = true) {
        self.name = name
        self.items = items
        self.collapsed = collapsed
    }
}

protocol LeftMenuProtocol : class {
    func changeViewController(_ menu: LeftMenu)
}

class LeftViewController : UIViewController, LeftMenuProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    //    var menus = ["Main", "Swift", "NonMenu"]
    var iconArray = ["home","box","user","cart","bell","plusx","transaction","logout"]
    
//    var myOrdersViewController: UIViewController!
//    var myProfileViewController : UIViewController!
    var notificationViewController : UIViewController!
    var productsPharmacistViewController: UIViewController!
    var transactionListViewController: UIViewController!
    var sellerOrderViewController: UIViewController!
    var pharmacistDashboardViewController: UIViewController!
    var addDeliveryBoyViewController: UIViewController!
    var pagingViewController: UIViewController!
    
    var imageHeaderView: ImageHeaderView!
    var sections = [Section]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sections = [
            Section(name: "Dashboard", items: []),
            Section(name: "Orders", items: []),
            Section(name: "Profile", items: []),
            Section(name: "Products", items: []),
            Section(name: "Notifications", items: []),
            Section(name: "Add Delivery Boy", items: []),
            Section(name: "Transactions", items: []),
            Section(name: "Logout", items: []),
        ]
        
        let footerView = UIView()
        footerView.frame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1)
        footerView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        tableView.tableFooterView = footerView
        
//        tableView.tableFooterView = UIView(frame: .zero)
//        tableView.tableFooterView?.isHidden = true
        
        let pharmacistDashboardViewController = kMainStoryboard.instantiateViewController(withIdentifier: kPharmacistDashboardVC)
        
        self.pharmacistDashboardViewController = UINavigationController(rootViewController: pharmacistDashboardViewController)
      
        let addDeliveryBoyViewController = kMainStoryboard.instantiateViewController(withIdentifier: kAddDeliveryBoyVC)
        self.addDeliveryBoyViewController = UINavigationController(rootViewController: addDeliveryBoyViewController)
        
        let productsPharmacistViewController = kMainStoryboard.instantiateViewController(withIdentifier: kProductsPharmacistVC)
        self.productsPharmacistViewController = UINavigationController(rootViewController: productsPharmacistViewController)
        
        let sellerOrderViewController = kMainStoryboard.instantiateViewController(withIdentifier: kSellerOrderVC)
        self.sellerOrderViewController = UINavigationController(rootViewController: sellerOrderViewController)
        
        let transactionListViewController = kMainStoryboard.instantiateViewController(withIdentifier: kTransactionListVC)
        self.transactionListViewController = UINavigationController(rootViewController: transactionListViewController)
        
        let notificationVC = kMainStoryboard.instantiateViewController(withIdentifier: "NotificationViewController") as! NotificationViewController
        self.notificationViewController = UINavigationController(rootViewController: notificationVC)
        
        let pagingViewController = kMainStoryboard.instantiateViewController(withIdentifier: kPageVC)
        self.pagingViewController = UINavigationController(rootViewController: pagingViewController)
        
        self.imageHeaderView = ImageHeaderView.loadNib()
        self.view.addSubview(self.imageHeaderView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.imageHeaderView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 160)
        self.view.layoutIfNeeded()
    }
    
    func changeViewController(_ menu: LeftMenu) {
        switch menu {
        case .home, .profile, .logout :
            self.slideMenuController()?.changeMainViewController(self.pharmacistDashboardViewController, close: true)
            
        case .orders:
            self.slideMenuController()?.changeMainViewController(self.sellerOrderViewController, close: true)
      
            
        case .notifications:
            self.slideMenuController()?.changeMainViewController(self.notificationViewController, close: true)
            
        case .transaction:
            self.slideMenuController()?.changeMainViewController(self.transactionListViewController, close: true)
            
        case .products:
            self.slideMenuController()?.changeMainViewController(self.productsPharmacistViewController, close: true)
            
        case  .addDeliveryBoy:
            self.slideMenuController()?.changeMainViewController(self.addDeliveryBoyViewController, close: true)
            
        default: break
        }
    }
}



extension LeftViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // Calculate the real section index and row index
        let section = getSectionIndex(indexPath.row)
        let row = getRowIndex(indexPath.row)
        
        // Header has fixed height
        if row == 0 {
            return 55.0
        }
        
        return sections[section].collapsed! ? 0 : 50.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Calculate the real section index and row index
        let section = getSectionIndex(indexPath.row)
        let row = getRowIndex(indexPath.row)
        
        if sections[section].name == "Order" {
            
            if let menu = LeftMenu(rawValue: sections[section].collapsed! ? section : section+row) {
                self.changeViewController(menu)
            }
        }else {
        
                if let menu = LeftMenu(rawValue: section) {
                    self.changeViewController(menu)
            }
        }
    }

}
extension LeftViewController : UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // For section 1, the total count is items count plus the number of headers
        var count = sections.count
        
        for section in sections {
            count += section.items.count
        }
        return count
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Calculate the real section index and row index
        let section = getSectionIndex(indexPath.row)
        let row = getRowIndex(indexPath.row)
        
        if row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "header") as! HeaderCell
            cell.titleLabel.text = sections[section].name
            cell.toggleButton.tag = section
            cell.iconImageView.image = UIImage.init(named: iconArray[section])

            if sections[section].items.count > 0 {
                cell.toggleButton.isHidden = false;
                cell.toggleButton.addTarget(self, action: #selector(LeftViewController.toggleCollapse), for: .touchUpInside)
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "subCell") as! SubCell
            cell.lblTitle.text = sections[section].items[row - 1]
            cell.imgIcon.image = UIImage.init(named: iconArray[section+row])
            return cell
        }
        
    }
        
    //
    // MARK: - Event Handlers
    //
    @objc func toggleCollapse(_ sender: UIButton) {
        let section = sender.tag
        let collapsed = sections[section].collapsed
        
        // Toggle collapse
        sections[section].collapsed = !collapsed!
        
        let indices = getHeaderIndices()
        
        let start = indices[section]
        let end = start + sections[section].items.count
        
        tableView.beginUpdates()
        for i in start ..< end + 1 {
            tableView.reloadRows(at: [IndexPath(row: i, section: 0)], with: .automatic)
        }
        tableView.endUpdates()
    }
    
    //
    // MARK: - Helper Functions
    //
    func getSectionIndex(_ row: NSInteger) -> Int {
        let indices = getHeaderIndices()
        
        for i in 0..<indices.count {
            if i == indices.count - 1 || row < indices[i + 1] {
                return i
            }
        }
        
        return -1
    }
    
    func getRowIndex(_ row: NSInteger) -> Int {
        var index = row
        let indices = getHeaderIndices()
        
        for i in 0..<indices.count {
            if i == indices.count - 1 || row < indices[i + 1] {
                index -= indices[i]
                break
            }
        }
        
        return index
    }
    
    func getHeaderIndices() -> [Int] {
        var index = 0
        var indices: [Int] = []
        
        for section in sections {
            indices.append(index)
            index += section.items.count + 1
        }
        
        return indices
    }
}
