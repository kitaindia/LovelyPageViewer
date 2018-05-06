//
//  RootViewController.swift
//  LovelyPageViewer
//
//  Created by 竹原正起 on 2018/05/06.
//  Copyright © 2018年 masaki.takehara. All rights reserved.
//

import UIKit

class RootViewController: UIPageViewController, UIPageViewControllerDelegate {
    
    var pageViewController: UIPageViewController?
    
    var _modelController: ModelController? = nil
    
    var modelController: ModelController {
        
        if _modelController == nil {
            _modelController = ModelController()
        }
        return _modelController!
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        self.pageViewController!.delegate = self
        
        let startingViewController: ImageViewController = self.modelController.viewControllerAtIndex(0, storyboard: self.storyboard!)!
        let viewControllers = [startingViewController]
        self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: false, completion: {done in })
        
        self.pageViewController!.dataSource = self.modelController
        self.addChildViewController(self.pageViewController!)
        self.view.addSubview(self.pageViewController!.view)
        
        var pageViewRect = self.view.bounds
        if UIDevice.current.userInterfaceIdiom == .pad {
            pageViewRect = pageViewRect.insetBy(dx: 40.0, dy: 40.0)
        }
        self.pageViewController!.view.frame = pageViewRect
        
        self.pageViewController!.didMove(toParentViewController: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
