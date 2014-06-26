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
@property (nonatomic, strong) NSArray *guessNumberArr;

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
    [self generateGuessNumber];
}
- (NSMutableAttributedString*)guessNumber:(NSString*)guess {
    
    int pls = 0;
    int mns = 0;
    
    NSMutableArray *numbsArr = [[NSMutableArray alloc] init];
    for (int i = 0; i < guess.length; i ++) {
        [numbsArr addObject:[NSString stringWithFormat:@"%c", [guess characterAtIndex:i]]];
    }
    
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    
    for (NSString *ch in numbsArr) {
        for (NSNumber *numb in self.guessNumberArr) {
            if ([numb isEqualToNumber:[f numberFromString:ch]]) {
                if ([self.guessNumberArr indexOfObject:numb] == [numbsArr indexOfObject:ch]) {
                    pls++;
                } else {
                    mns++;
                }
            }
        }
    }
    
    NSMutableParagraphStyle *paragrapStyle = NSMutableParagraphStyle.new;
    paragrapStyle.alignment = NSTextAlignmentCenter;
    
    NSMutableAttributedString *result = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ : ",guess] attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont fontWithName:@"Chalkboard SE" size:28], NSParagraphStyleAttributeName:paragrapStyle}];
    
    //NSString* result = [NSString stringWithFormat:@"%@ : ",guess];
    NSMutableAttributedString *plsTxt = [[NSMutableAttributedString alloc] init];
    NSMutableAttributedString *mnsTxt = [[NSMutableAttributedString alloc] init];
    NSMutableAttributedString *zeroTxt = [[NSMutableAttributedString alloc] init];
    
    if (pls != 0) {
        plsTxt = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"+%d ", pls] attributes:@{NSForegroundColorAttributeName:[UIColor greenColor],NSFontAttributeName:[UIFont fontWithName:@"Chalkboard SE" size:28], NSParagraphStyleAttributeName:paragrapStyle}];
        
        [result appendAttributedString:plsTxt];
        
    }
    if (mns != 0) {
        mnsTxt = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"-%d ", mns] attributes:@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont fontWithName:@"Chalkboard SE" size:28], NSParagraphStyleAttributeName:paragrapStyle}];
        
        [result appendAttributedString:mnsTxt];
    }
    
    if (mns == 0 && pls == 0) {
        zeroTxt = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%d ",pls] attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont fontWithName:@"Chalkboard SE" size:28], NSParagraphStyleAttributeName:paragrapStyle}];
        
        [result appendAttributedString:zeroTxt];
    }
    
    if (result.length < 13) {
        for (NSUInteger i = result.length; i < 13; i++) {
            NSAttributedString* sp = [[NSAttributedString alloc] initWithString:@"-" attributes:@{NSForegroundColorAttributeName:[UIColor clearColor],NSFontAttributeName:[UIFont fontWithName:@"Chalkboard SE" size:28]}];
            [result appendAttributedString:sp];
        }
    }
    
    if (pls > 3) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"NumberFound" object:self];
    }
    
    return result;
}

#pragma mark private methods

- (void)generateGuessNumber {
    
    NSMutableArray *numbArray = [@[] mutableCopy];
    
    while (numbArray.count<4) {
        NSNumber *r = [NSNumber numberWithInt:arc4random() % 10];
        BOOL exist = NO;
        for (NSNumber* numb in numbArray) {
            if (numb == r) {
                exist = YES;
            }
        }
        if (!exist) {
            if ([r intValue] != 0) {
                [numbArray addObject:r];
            }
        }
    }
    
    NSNumber *composedNumb;
    
    for (int i=0; i<numbArray.count; i++) {
        composedNumb = [NSNumber numberWithDouble:[composedNumb intValue] + [numbArray[i] intValue]*pow(10, i)];
    }
    
    [self setGuessNumber:composedNumb];
    [self setGuessNumberArr:[[numbArray reverseObjectEnumerator] allObjects]];
    
    NSLog(@"gen : %@",self.guessNumber);
}
@end
