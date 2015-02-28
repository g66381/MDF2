//
//  ViewController.m
//  MDF2_Project3
//
//  Created by Johnny Kay on 2/18/15.
//  Copyright (c) 2015 Johnny Kay. All rights reserved.
//

#import "ViewController.h"
#import "PhotoViewController.h"
#import "VideoViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController ()

@end

@implementation ViewController
@synthesize imgDetailVC, vidDetailVC;

- (void)viewDidLoad {
    
    // Loads PhotoViewController
    self.imgDetailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PhotoViewController"];
    //self.vidDetailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"VideoViewController"];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)photoClick:(id)sender
{
    // Runs the camera for the user to capture an image
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    if (picker != nil) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.delegate = self;
        picker.mediaTypes = @[(NSString *)kUTTypeImage];
        
        picker.allowsEditing = true;
        
        [self presentViewController:picker animated:true completion:nil];
    }

}

-(IBAction)galleryClick:(id)sender
{
    // Runs the photo library for the user to grab and edit an image already on the phone
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    if (picker != nil) {
        picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        picker.delegate = self;
        
        picker.allowsEditing = true;
        
        [self presentViewController:picker animated:true completion:nil];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // Passes selected image to view
    UIImage *selectedImg = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    if (selectedImg != nil) {
        
        self.imgDetailVC.original = selectedImg;
    
    }
    
    // Passes selected edited image to view
    UIImage *editImg = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    if (editImg != nil) {
        self.imgDetailVC.edited = editImg;
    }
    
    [picker dismissViewControllerAnimated:true completion:nil];
    
    [self presentViewController:imgDetailVC animated:true completion:nil];
    
}

@end
