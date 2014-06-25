//
//  GuessNumberModel.h
//  GuessMyNumber
//
//  Created by Emrah on 25.06.2014.
//  Copyright (c) 2014 Emrah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GuessNumberModel : NSObject

+ (GuessNumberModel *)sharedGuessNumberModel;

- (void)beginNewGame;
- (NSString*)guessNumber:(NSNumber*)guess;


@end
