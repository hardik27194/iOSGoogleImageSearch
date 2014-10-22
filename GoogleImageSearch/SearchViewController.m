//
//  SearchViewController.m
//  GoogleImageSearch
//
//  Created by Daniel on 10/21/14.
//  Copyright (c) 2014 DT. All rights reserved.
//

#import "SearchViewController.h"
#import "PhotoCollectionViewController.h"

@interface SearchViewController ()
@property (weak,nonatomic) PhotoCollectionViewController * pcvc;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"photoCollectionEmbed"]) {
        if ([segue.destinationViewController isKindOfClass:[PhotoCollectionViewController class]]) {
            self.pcvc = segue.destinationViewController;
        }
    }
}

@end
