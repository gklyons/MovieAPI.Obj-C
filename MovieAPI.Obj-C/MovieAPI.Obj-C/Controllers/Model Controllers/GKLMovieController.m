//
//  GKLMovieController.m
//  MovieAPI.Obj-C
//
//  Created by Garrett Lyons on 3/27/20.
//  Copyright © 2020 Turtle. All rights reserved.
//

#import "GKLMovieController.h"
#import "GKLMovie.h"

static NSString * const appKey = @"503f0bae1d2d764c31baee5f20818ae7";
static NSString * const baseURLString = @"https://api.themoviedb.org/3/";
static NSString * const imageBaseURL = @"https://image.tmdb.org/t/p/w500/";

@implementation GKLMovieController

+(void)fetchMovie:(NSString *)searchTerm completion:(void (^)(GKLMovie * _Nullable))completion {
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    
    baseURL = [[baseURL URLByAppendingPathComponent:@"search"] URLByAppendingPathComponent:@"movie"];
    baseURL = [baseURL URLByAppendingPathComponent:searchTerm.lowercaseString];
    
    NSURLComponents *urlComponents = [[NSURLComponents new] initWithURL:baseURL resolvingAgainstBaseURL:true];
    
    urlComponents.queryItems = @[[NSURLQueryItem queryItemWithName:@"strictMatch" value:@"false"]];
    
    NSURL *finalURL = [urlComponents URL];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:finalURL];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request addValue:appKey forHTTPHeaderField:@"api_key"];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
            completion(nil);
            return;
        }
        
        if (!data)
        {
            NSLog(@"%@", error);
            completion(nil);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if (!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"Error fetching JSON Dictionary: %@", error);
            completion(nil);
            return;
        }
        
        NSDictionary *topLevelObject = jsonDictionary[@"results"];
        
        GKLMovie *movie = [[GKLMovie new] initWithDictionary:topLevelObject];
        completion(movie);
        
    }]resume];
}

+ (void)fetchPoster:(GKLMovie *)movie completion:(void (^)(UIImage * _Nullable))completion {
    NSURL *imageFileURL = [NSURL URLWithString:movie.imageURL];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:imageFileURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"%@", error);
            completion(nil);
            return;
        }
        
        if (!data)
        {
            NSLog(@"%@", error);
            completion(nil);
            return;
        }
        
        UIImage *image = [[UIImage alloc] initWithData:data];
        completion(image);
        
    }] resume];
    
}



@end
