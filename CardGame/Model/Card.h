//
//  Card.h
//  CardGame
//
//  Created by Ahmad Ilaiwi on 7/6/14.
//  Copyright (c) 2014 Ahmad Ilaiwi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (nonatomic) NSString* contents;
@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;
-(int)match:(NSArray*)otherCards;

@end
