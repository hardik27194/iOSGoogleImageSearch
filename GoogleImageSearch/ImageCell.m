//
//  ImageCell.m
//  GoogleImageSearch
//
//  Created by Daniel on 10/21/14.
//  Copyright (c) 2014 DT. All rights reserved.
//

#import "ImageCell.h"

@implementation ImageCell

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = self.contentView.bounds;
}

@end
