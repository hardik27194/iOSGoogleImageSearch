//
//  ImageController.h
//  GoogleImageSearch
//
//  Created by Daniel on 10/21/14.
//  Copyright (c) 2014 DT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageController : NSObject

+ (void)imageFromInfo:(NSDictionary *)info completion:(void(^)(UIImage *image))completion;

@end
