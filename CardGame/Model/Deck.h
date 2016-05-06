//
//  Deck.h
//  CardGame
//
//  Created by Ahmad Ilaiwi on 7/6/14.
//  Copyright (c) 2014 Ahmad Ilaiwi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface Deck : NSObject

-(void)addCard:(Card*)card atTop:(BOOL)atTop;
-(void)addCard:(Card*)card;
-(Card*)drawRandomCard;
@end
