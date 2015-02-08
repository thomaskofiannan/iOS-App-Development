//
//  DetailtViewController.swift
//  Swift-UICollectionView
//
//  Created by Rohim Developer on 2/3/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

import UIKit

class DetailtViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = titlesArray[rowNumber]
        
        let imgName = "pin\(rowNumber+1).jpg"
        img.image = UIImage(named: imgName)

        
        
        // Do any additional setup after loading the view.
        
    }


}
