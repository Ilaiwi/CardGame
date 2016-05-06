//
//  PlayingCard.m
//  CardGame
//
//  Created by Ahmad Ilaiwi on 7/8/14.
//  Copyright (c) 2014 Ahmad Ilaiwi. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
@synthesize suit=_suit;
-(NSString*)contents{
    NSArray* rankStrings=[PlayingCard rankString];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}
+(NSArray *) validSuits{
    return @[@"♥",@"♦",@"♠",@"♣"];
}
-(void)setSuit:(NSString *)suit{
    if([[PlayingCard validSuits] containsObject:suit ]){
        _suit=suit;
    }
}
-(NSString*)suit{
    return _suit ? _suit : @"?";
}
+(NSArray*) rankString{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"k"];
}
+(NSUInteger)maxRank{return [[PlayingCard rankString] count]-1;
}
-(void)setRank: (NSUInteger) rank{
    if(_rank<=[PlayingCard maxRank]){
    _rank=rank;
    }
}
//this method is designed  so it can match as many cards as the game passes and give if the suit or the rank matches
-(NSInteger)match:(NSArray *)otherCards{
    int score=0;
    BOOL rankMatch=YES;
    BOOL suitMatch=YES;
    for (PlayingCard* card in otherCards) {
        if (self.rank!=card.rank) {
            rankMatch=NO;
        }
        if (![self.suit isEqualToString:card.suit]) {
            suitMatch=NO;
        }
    }
    if (rankMatch) {
        score=2;
    }
    if (suitMatch) {
        score=1;
    }
    return score;
     
}
-(NSString*)description{
    return [self contents];
}
    
@end
