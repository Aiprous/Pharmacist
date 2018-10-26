//
//  PageViewController.swift
//  Pharmacist
//
//  Created by SBC on 09/10/18.
//  Copyright © 2018 Aiprous. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate
 {
    var pages = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    self.delegate = self
    self.dataSource = self
    
        let page1: UIViewController! = kMainStoryboard.instantiateViewController(withIdentifier: kPharmacistOrderItemVC)
        let page2: UIViewController! = kMainStoryboard.instantiateViewController(withIdentifier: kPharmacistInvoiceVC)
         let page3: UIViewController! = kMainStoryboard.instantiateViewController(withIdentifier: kPharmacistShipmentVC)
    
    pages.append(page1)
    pages.append(page2)
    pages.append(page3)
        
        setViewControllers([page1], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - PageViewController DataSource
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    let currentIndex = pages.index(of: viewController)
        let previousIndex = abs((currentIndex! - 1) % pages.count)
    return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    let currentIndex = pages.index(of: viewController)
        let nextIndex = abs((currentIndex! + 1) % pages.count)
    return pages[nextIndex]
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItemBackButton()
    }

}
