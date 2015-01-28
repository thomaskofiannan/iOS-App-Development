//
//  OpenPdfInIbooksViewController.m
//  DemoAppObjC
//
//  Created by Rohim Developer on 1/15/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

#import "OpenPdfInIbooksViewController.h"

@interface OpenPdfInIbooksViewController ()


@end

@implementation OpenPdfInIbooksViewController

@synthesize docController;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)openPDF:(id)sender {
    
    //in bar button IBAction
    NSString *path = [[NSBundle mainBundle] pathForResource:@"book" ofType:@"pdf"];
    NSURL *targetURL = [NSURL fileURLWithPath:path];
    
    
    docController = [UIDocumentInteractionController interactionControllerWithURL:targetURL];
    
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"itms-books:"]]) {
        
        [docController presentOpenInMenuFromRect:CGRectZero inView:self.view animated:YES];
        NSLog(@"iBooks installed");
        
    } else {
        
        NSLog(@"iBooks not installed");
        
    }
}



@end
