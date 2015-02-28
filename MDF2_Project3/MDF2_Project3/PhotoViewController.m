//
//  PhotoViewController.m
//  MDF2_Project3
//
//  Created by Johnny Kay on 2/20/15.
//  Copyright (c) 2015 Johnny Kay. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    
    // Sets images in image views
    editImg.image = self.edited;
    originalImg.image = self.original;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction)saveImg:(id)sender
{
    // Saves images to photo album
    UIImageWriteToSavedPhotosAlbum(self.edited, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    UIImageWriteToSavedPhotosAlbum(self.original, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (!error) {
        // Save was successful
        saveAlert = [[UIAlertView alloc] initWithTitle:@"Save Successful!"
            message:nil
            delegate:nil
            cancelButtonTitle:nil
            otherButtonTitles:nil];
        
        [saveAlert show];
        [saveAlert dismissWithClickedButtonIndex:0 animated:true];
        
    } else {
        
        // Save was unsuccessful
        errorAlert = [[UIAlertView alloc] initWithTitle:@"There was an error saving your picture. Try again."
            message:nil
            delegate:nil
            cancelButtonTitle:@"Okay"
            otherButtonTitles:nil];
        
        [errorAlert show];

    }
    
}

// Closes view back to table view
-(IBAction)close:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
