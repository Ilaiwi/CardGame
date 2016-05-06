//
//  GameResult.h
//  Machismo
//
//  Created by Sam on 11/4/13.
//  Copyright (c) 2013 Sam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameResult : NSObject
@property (nonatomic) NSDate *start;
@property (nonatomic) NSDate *end;
@property (nonatomic) NSTimeInterval duration;
@property (nonatomic) int score;
@end
