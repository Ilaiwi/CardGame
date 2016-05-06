//
//  MCViewController.m
//  CardGame
//
//  Created by Ahmad Ilaiwi on 7/3/14.
//  Copyright (c) 2014 Ahmad Ilaiwi. All rights reserved.
//

#import "MCViewController.h"
#import "Model/PlayingCardDeck.h"
#import "Model/Card.h"
#import "Model/CardMatchingGame.h"
//constants for the modes (2 or 3 cards)
#define TWO_CARD_MODE 1
#define THREE_CARD_MODE 2

@interface MCViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;
@property (nonatomic)  int count;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gameMode;
@property (nonatomic) CardMatchingGame * game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property(nonatomic) int mode;

@end

@implementation MCViewController
- (IBAction)deal:(UIButton *)sender {
    self.gameMode.enabled=YES;
    //so a new game is initilized when the getter is called
    _game=nil;
    //just to fllip cards on its back
    for (UIButton* button in self.buttons) {
        button.alpha=1;
        button.enabled=YES;
        [button setBackgroundImage:[UIImage imageNamed:@"BackCard"] forState:UIControlStateNormal];
        [button setTitle:@"" forState:UIControlStateNormal];
    }
    self.scoreLabel.text=@"Score:0";
    self.statusLabel.text=@"NEW GAME!";

}
-(int)mode{
    if(!_mode){
    _mode=TWO_CARD_MODE;
    }
    return _mode;
}
@synthesize game=_game;
-(Deck*)creatDeck{
        return [[PlayingCardDeck alloc]init];

}
-(CardMatchingGame*)game{
    
    if(!_game) _game=[[CardMatchingGame alloc]initWithCardCount:[self.buttons count] withDeck:[self creatDeck] matchingNumberOfCards:self.mode];
    return _game;
}
- (void)viewDidLoad
{
    for (UIButton* button in self.buttons) {
        [button setBackgroundImage :[UIImage imageNamed:@"BackCard"] forState:UIControlStateNormal];
    }
}
- (IBAction)gameMode:(UISegmentedControl *)sender {
    if(sender.selectedSegmentIndex==1){
        self.mode=THREE_CARD_MODE;
    }
    if(sender.selectedSegmentIndex==0){
        self.mode=TWO_CARD_MODE;
      

    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}
- (IBAction)flipCard:(UIButton *)sender {
    self.gameMode.enabled=NO;
    NSInteger indexOfChoosenCard=[self.buttons indexOfObject:sender];
    //here is the only place that the game could be initialized 
    [self.game chooseCardAtIndex:indexOfChoosenCard];
    [self updateUI];
}
-(void)updateUI{
    for (UIButton* button in self.buttons) {
        NSUInteger buttonIndex=[self.buttons indexOfObject:button];
        Card* card=[self.game cardAtIndex:buttonIndex];
        if(card.isChosen){
            [button setBackgroundImage:nil forState:UIControlStateNormal];
            [button setTitle:card.contents forState:UIControlStateNormal];
        }
        else{
            [button setBackgroundImage :[UIImage imageNamed:@"BackCard"] forState:UIControlStateNormal];
            [button setTitle:@"" forState:UIControlStateNormal];
        }
        button.enabled=!card.isMatched;
        if(!button.enabled){
            button.alpha=0.5;
        }
        self.statusLabel.text=_game.status;
        self.scoreLabel.text=[NSString stringWithFormat:@"Score:%d",self.game.score];
        }
    
}
@end
