//
//  PlayingCard.h
//  CardGame
//
//  Created by Ahmad Ilaiwi on 7/8/14.
//  Copyright (c) 2014 Ahmad Ilaiwi. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card
@property(nonatomic) NSString* suit;
@property(nonatomic) NSUInteger rank;
+(NSArray*) validSuits;
+(NSUInteger) maxRank;
@end
