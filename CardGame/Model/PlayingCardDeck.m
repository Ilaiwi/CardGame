//
//  PlayingCardDeck.m
//  CardGame
//
//  Created by Ahmad Ilaiwi on 7/11/14.
//  Copyright (c) 2014 Ahmad Ilaiwi. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck
-(id)init{
    self=[super init];
    if(self){
        for (NSString *suit  in [PlayingCard validSuits]) {
            for (int rank=1; rank<=[PlayingCard maxRank]; rank++) {
                PlayingCard *card=[[PlayingCard alloc]init];
                card.suit=suit;
                card.rank=rank;
                [self addCard:card];
            }
        }
    }
        return self;
}
@end
