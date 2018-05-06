//
//  ImageViewController.swift
//  LovelyPageViewer
//
//  Created by 竹原正起 on 2018/05/06.
//  Copyright © 2018年 masaki.takehara. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var dataObject: UIImage = UIImage(named: "0001.jpg")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.imageView.image = dataObject
    }
}
