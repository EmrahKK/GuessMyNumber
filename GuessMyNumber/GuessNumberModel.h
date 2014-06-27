//
//  GuessNumberModel.h
//  GuessMyNumber
//
//  Created by Emrah on 25.06.2014.
//  Copyright (c) 2014 Emrah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GuessNumberModel : NSObject

@property (nonatomic, strong) NSNumber *guessNumber;
@property (nonatomic) int guessCount;

+ (GuessNumberModel *)sharedGuessNumberModel;

- (void)beginNewGame;
- (NSMutableAttributedString*)guessNumber:(NSString*)guess;


@end
