//
//  ModelController.swift
//  LovelyPageViewer
//
//  Created by 竹原正起 on 2018/05/06.
//  Copyright © 2018年 masaki.takehara. All rights reserved.
//

import UIKit

class ModelController: NSObject, UIPageViewControllerDataSource {

    var pageData: [UIImage] = []
    
    override init() {
        super.init()
        
        for num in 1...11 {
            if let image = UIImage(named: String(format: "%04d", num) + ".jpg") {
                pageData.append(image)
            }
        }
    }
    
    func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> ImageViewController? {
        // Return the data view controller for the given index.
        if (self.pageData.count == 0) || (index >= self.pageData.count) {
            return nil
        }
        
        // Create a new view controller and pass suitable data.
        let imageViewController = storyboard.instantiateViewController(withIdentifier: "ImageViewController") as! ImageViewController
        imageViewController.dataObject = self.pageData[index]
        return imageViewController
    }
    
    func indexOfViewController(_ viewController: ImageViewController) -> Int {
        return pageData.index(of: viewController.dataObject) ?? NSNotFound
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! ImageViewController)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! ImageViewController)
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        if index == self.pageData.count {
            return nil
        }
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }

}
