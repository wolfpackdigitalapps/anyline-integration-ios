//
//  WelcomeViewController.swift
//  AnylineTestPods
//
//  Created by Dan Ilies on 21/05/2019.
//  Copyright © 2019 Wolfpack-Digital. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - ViewController Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        let logo = UIImage(named: "anylineLogo")
        let imageView = UIImageView(image: logo)
        self.navigationItem.titleView = imageView
    }
}
