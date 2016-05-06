//
//  CardMatchingGame.h
//  CardGame
//
//  Created by Ahmad Ilaiwi on 7/11/14.
//  Copyright (c) 2014 Ahmad Ilaiwi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "card.h"
@interface CardMatchingGame : NSObject{}
@property (readonly,nonatomic) NSInteger score;
@property(readonly,nonatomic) NSString* status;
-(id)initWithCardCount:(NSInteger)count withDeck:(Deck*) deck matchingNumberOfCards:(int)i;
-(void)chooseCardAtIndex:(NSInteger)index ;
-(Card*)cardAtIndex:(NSInteger)index;
@end
