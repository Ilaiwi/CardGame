//
//  GameResult.m
//  Machismo
//
//  Created by Sam on 11/4/13.
//  Copyright (c) 2013 Sam. All rights reserved.
//

#import "GameResult.h"

@implementation GameResult
-(NSDictionary *) asProperty
{
    return @{ @"start":self.start, @"end":self.end, @"score":@(self.score)};
}
-(void) synchronize
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *allResultsDictionary = [[defaults dictionaryForKey:@"all_results"]mutableCopy];
    
    if ( !allResultsDictionary)
    {
        allResultsDictionary = [[NSMutableDictionary alloc] init];
    }
    
    NSDictionary *resultDictionary = [self asProperty];
    
    //NSLog(@"%@",resultDictionary);
    
    [allResultsDictionary setObject:resultDictionary forKey:[self.start description]];
    
    [defaults    setObject:allResultsDictionary forKey:@"all_results"];
    
    //NSLog(@"%@",allResultsDictionary);
    [defaults synchronize];
    
}
-(id) init
{
    self = [super init];
    
    if (self)
    {
        _start  = [NSDate date];
        _end    = _start;
        _score   = 0 ;
        
    }
    
    return self;
}
-(NSTimeInterval) duration
{
    return [self.end timeIntervalSinceDate:self.start];
}
-(void) setScore:(int)score
{
    _score = score;
    self.end = [NSDate date];
    [self synchronize];
}
@end
