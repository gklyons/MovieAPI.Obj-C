//
//  GKLMovie.m
//  MovieAPI.Obj-C
//
//  Created by Garrett Lyons on 3/27/20.
//  Copyright © 2020 Turtle. All rights reserved.
//
//https://api.themoviedb.org/3/search/movie

#import "GKLMovie.h"
#import <UIKit/UIKit.h>

@implementation GKLMovie

-(instancetype)initWithTitle:(NSString *)title
                      rating:(NSNumber *)rating
                    overview:(NSString *)overview
               imageEndpoint:(NSString *)imageEndpoint
                       image:(UIImage *)image;
{
    self = [super init];
    if (self) {
        _title = title;
        _rating = rating;
        _overview = overview;
        _imageEndpoint = imageEndpoint;
        _imageURL = image;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id>*)dictionary;
{
    NSString *title = dictionary[@"original_title"];
    NSString *rating = dictionary[@"vote_average"];
    NSString *overview = dictionary[@"overview"];
    NSString *imageEndpoint = dictionary[@"imageEndpoint"];
    NSString *image = dictionary[@"poster_path"];
    
    return [self initWithTitle:title rating:rating overview:overview imageEndpoint:imageEndpoint image:image];
}

@end
