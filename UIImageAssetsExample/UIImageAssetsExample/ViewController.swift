//
//  ViewController.swift
//  UIImageAssetsExample
//
//  Created by Matija Kruljac on 3/16/19.
//  Copyright © 2019 Matija Kruljac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstImageView.image = UIImage.bora_bora
        secondImageView.image = UIImage.sunset
    }
}
