//
//  CardMatchingGame.m
//  CardGame
//
//  Created by Ahmad Ilaiwi on 7/11/14.
//  Copyright (c) 2014 Ahmad Ilaiwi. All rights reserved.
//

#import "CardMatchingGame.h"
@interface CardMatchingGame()
@property(readwrite,nonatomic)NSInteger score;
@property(readwrite,nonatomic)NSString* status;
@property(nonatomic)NSMutableArray *cards;
@property (nonatomic) int numberOfMatch;
@end
@implementation CardMatchingGame

static const int MATCH_BOUNS=4;
static const int MISS_PENALTY=2;
static const int CHOOSE_PENALTY=1;

-(NSMutableArray*)cards{
    if(!_cards) _cards=[[NSMutableArray alloc] init];
    return _cards;
}
//new parameter added so the game knows the number of cards to match
-(id)initWithCardCount:(NSInteger)count withDeck:(Deck *)deck matchingNumberOfCards:(int)i
{
    self=[super init];
    if(self){
        self.numberOfMatch=i;
        for (int i=0; i<count; i++) {
            Card* card=[deck drawRandomCard];
            if(card){
            [self.cards addObject:card];
            }
            else
            {
                self=nil;
                break;
            }
        }

    }
        return self;
}
-(Card*)cardAtIndex:(NSInteger)index{
    return  ([self.cards count]>index) ? self.cards[index] : nil ;
}
//This code is designed so that it  could be used to match any number of cards by just add a (constant of number of cards to match – 1) to the init method
-(void)chooseCardAtIndex:(NSInteger)index{
    NSMutableArray* cards =[[NSMutableArray alloc]init];
    self.status=nil;
    Card* card=[self cardAtIndex:index];
    if(!card.isMatched){
        if (card.isChosen) {
            card.chosen=NO;
            self.status=(!self.status)?[NSString stringWithFormat:@"The filliped back card %@",card.contents]:self.status;
        }
        else
        {
            for (Card* otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    [cards addObject:otherCard];
                }
            }
            if ([cards count]>self.numberOfMatch) {
                for (Card* choosenCard in cards) {
                    choosenCard.chosen=NO;
                }
            }
            else if([cards count]== self.numberOfMatch)
            {
                int matchScore=0;
                matchScore=[card match:cards];
                if (matchScore>0) {
                    self.score+=matchScore*MATCH_BOUNS*self.numberOfMatch;
                    card.matched=YES;
                    for (Card* choosenCard in cards) {
                        choosenCard.matched=YES;
                    }
                    if (matchScore==2) {
                        self.status=[NSString stringWithFormat:@"%@ , %@ RANK MATCHED!! You get %d points",card,[cards componentsJoinedByString:@" , "] ,matchScore*MATCH_BOUNS*self.numberOfMatch];
                    }
                    else{
                        self.status=[NSString stringWithFormat:@" %@ , %@ suit MATCHED!! You get %d points",card,[cards componentsJoinedByString:@" , "] ,matchScore*MATCH_BOUNS*self.numberOfMatch];
                    }
                }
                else{
                    self.status=[NSString stringWithFormat:@"%@ , %@ dont match!! %d point penalty",card,[cards componentsJoinedByString:@" , "] ,MISS_PENALTY];
                    self.score-=MISS_PENALTY ;
                    for (Card* choosenCard in cards) {
                        choosenCard.chosen=NO;
                    }
                }
            }
            
            self.status=(!self.status)?[NSString stringWithFormat:@"The filliped up card %@",card.contents]:self.status;
            self.score-=CHOOSE_PENALTY;
            card.chosen=YES;
        }
    }
    
}

@end
