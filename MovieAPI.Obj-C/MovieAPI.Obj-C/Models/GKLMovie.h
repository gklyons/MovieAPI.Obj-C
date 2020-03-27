//
//  GKLMovie.h
//  MovieAPI.Obj-C
//
//  Created by Garrett Lyons on 3/27/20.
//  Copyright © 2020 Turtle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GKLMovie : NSObject

@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSNumber *rating;
@property (nonatomic, readonly) NSString *overview;
@property (nonatomic, readonly) NSString *imageEndpoint;
@property (nonatomic, readonly, nullable) NSString *imageURL;


@end

@interface GKLMovie (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
