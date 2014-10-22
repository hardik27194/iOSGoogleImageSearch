//
//  PhotoPickerViewController.m
//  GoogleImageSearch
//
//  Created by Daniel on 10/21/14.
//  Copyright (c) 2014 DT. All rights reserved.
//

#import "PhotoPickerViewController.h"
#import "DetailViewController.h"
#import "PresentDetailTransition.h"
#import "DismissDetailTransition.h"
#import "DZNPhotoPickerController.h"

@interface PhotoPickerViewController () <UIViewControllerTransitioningDelegate>

@end

@implementation PhotoPickerViewController

+ (void)initialize
{
    [DZNPhotoPickerController registerService:DZNPhotoPickerControllerServiceGoogleImages
                                  consumerKey:@"AIzaSyBiRs6vQmTVseUnMqUtJwpaJX-m5o9Djr0"
                               consumerSecret:@"018335320449571565407:tg2a0fkobws"
                                 subscription:DZNPhotoPickerControllerSubscriptionFree];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    DZNPhotoPickerController *picker = [[DZNPhotoPickerController alloc] init];
    picker.supportedServices = DZNPhotoPickerControllerServiceGoogleImages;
    picker.delegate = self;
    picker.allowsEditing = NO;
    picker.initialSearchTerm = @"Shuttle";
    picker.enablePhotoDownload = YES;
    picker.allowAutoCompletedSearch = YES;
    
    [self presentViewController:picker animated:NO completion:nil];
    
    picker.finalizationBlock = ^(DZNPhotoPickerController *picker, NSDictionary *info) {
        DetailViewController *detailViewController = [[DetailViewController alloc] init];
        detailViewController.modalPresentationStyle = UIModalPresentationCustom;
        detailViewController.transitioningDelegate = self;
        detailViewController.imageInfo = info;
        
        [picker presentViewController:detailViewController animated:YES completion:nil];
    };
        
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [[PresentDetailTransition alloc] init];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [[DismissDetailTransition alloc] init];
}


@end
