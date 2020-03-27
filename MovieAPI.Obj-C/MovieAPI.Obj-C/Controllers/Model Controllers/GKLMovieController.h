//
//  GKLMovieController.h
//  MovieAPI.Obj-C
//
//  Created by Garrett Lyons on 3/27/20.
//  Copyright © 2020 Turtle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class GKLMovie;

@interface GKLMovieController : NSObject

+(void)fetchMovie:(NSString *)searchTerm completion:(void(^)(GKLMovie * _Nullable))completion;
+(void)fetchPoster:(GKLMovie *)movie completion:(void(^)(UIImage * _Nullable))completion;

@end

NS_ASSUME_NONNULL_END
