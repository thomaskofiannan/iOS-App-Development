//
//  UploadImageViewController.h
//  DemoAppObjC
//
//  Created by Rohim Developer on 1/16/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"

@interface UploadImageViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end
