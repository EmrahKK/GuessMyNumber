//
//  GuessNumberModel.m
//  GuessMyNumber
//
//  Created by Emrah on 25.06.2014.
//  Copyright (c) 2014 Emrah. All rights reserved.
//

#import "GuessNumberModel.h"


@interface GuessNumberModel ()

@property (nonatomic, strong) NSNumber *guessNumber;

@end

@implementation GuessNumberModel

static GuessNumberModel *guessNumberModel = nil;    // static instance variable

+ (GuessNumberModel *)sharedGuessNumberModel {
    if (guessNumberModel == nil) {
        guessNumberModel = [[super allocWithZone:NULL] init];
    }
    return guessNumberModel;
}

- (void)beginNewGame {
    
}
- (NSString*)guessNumber:(NSNumber*)guess {
    
    return @"1234";
}

#pragma mark private methods

- (void)generateGuessNumber {
    
    NSMutableArray *numbArray = [@[] mutableCopy];
    
    while (numbArray.count<4) {
        NSNumber *r = [NSNumber numberWithInt:rand() % 10];
        BOOL exist = NO;
        for (NSNumber* numb in numbArray) {
            if (numb == r || r == 0) {
                exist = YES;
            }
        }
        if (!exist) {
            [numbArray addObject:r];
        }
    }
    NSNumber *composedNumb;
    
    
    for (int i=0; i<numbArray.count; i++) {
        composedNumb = [NSNumber numberWithDouble:[composedNumb intValue] + [numbArray[i] intValue]*pow(10, i)];
    }
    
    [self setGuessNumber:composedNumb];
    NSLog(@"%@",self.guessNumber);
}


@end
