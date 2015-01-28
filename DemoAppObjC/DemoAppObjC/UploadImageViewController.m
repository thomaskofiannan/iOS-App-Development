//
//  UploadImageViewController.m
//  DemoAppObjC
//
//  Created by Rohim Developer on 1/16/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

#import "UploadImageViewController.h"

@interface UploadImageViewController ()

@end

@implementation UploadImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)pickAction:(id)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

//-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
//    
//}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
    _imageView.image = image;
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
    
}


- (IBAction)uploadAction:(id)sender {
    


    
    
//    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://pharmacy.smart-kw.com/img/upload.php"]];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    NSData *imageData = UIImageJPEGRepresentation(_imageView.image, 0.5);
//    NSDictionary *parameters = @{@"message": @"Message"};
//    AFHTTPRequestOperation *op = [manager POST:@"rest.of.url" parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        //do not put image inside parameters dictionary as I did, but append it!
//        [formData appendPartWithFileData:imageData name:@"file" fileName:@"upload.jpg" mimeType:@"image/jpeg"];
//    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"Success: %@ ***** %@", operation.responseString, responseObject);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Error: %@ ***** %@", operation.responseString, error);
//    }];
//    [op start];
//    
//    
//    [self dismissViewControllerAnimated:YES completion:nil];

}
    


-(BOOL) prefersStatusBarHidden{
    return true;
}



@end
