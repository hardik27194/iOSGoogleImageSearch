//
//  ImageController.m
//  GoogleImageSearch
//
//  Created by Daniel on 10/21/14.
//  Copyright (c) 2014 DT. All rights reserved.
//

#import "ImageController.h"
#import <SAMCache/SAMCache.h>

@implementation ImageController

+ (void)imageFromInfo:(NSDictionary *)info completion:(void(^)(UIImage *image))completion
{
    if (info == nil || completion == nil) {
        return;
    }
    
    NSString *key = [[NSString alloc] initWithFormat:@"%@", info[@"com.dzn.photoPicker.photoMetadata"][@"source_url"]];
    UIImage *image = [[SAMCache sharedCache] imageForKey:key];
    
    if (image) {
        completion(image);
        return;
    }
    
    NSURL *url = info[@"com.dzn.photoPicker.photoMetadata"][@"source_url"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        NSData *data = [[NSData alloc] initWithContentsOfURL:location];
        UIImage *image = [[UIImage alloc] initWithData:data];
        [[SAMCache sharedCache] setImage:image forKey:key];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(image);
        });
    }];
    [task resume];
    
}

@end
