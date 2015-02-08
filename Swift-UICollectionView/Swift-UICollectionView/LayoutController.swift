//
//  LayoutController.swift
//  Swift-UICollectionView
//
//  Created by Rohim Developer on 2/3/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

var titlesArray = [String]()
var rowNumber : Int = 0

class LayoutController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        titlesArray = ["Sand Harbor, Lake Tahoe - California","Beautiful View of Manhattan skyline.","Watcher in the Fog","Great Smoky Mountains National Park, Tennessee","Most beautiful place"]
        
    }



    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return titlesArray.count
    }


    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as UICollectionViewCell
        
        //cell.titleLabel.text = "Test"
    
        let label = cell.viewWithTag(1000) as UILabel
        label.text = titlesArray[indexPath.row]
        
        let img = cell.viewWithTag(1001) as UIImageView
        let imgName = "pin\(indexPath.row+1).jpg"
        img.image = UIImage(named: imgName)

        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        rowNumber = indexPath.row
        performSegueWithIdentifier("show", sender: nil)
    }


}
