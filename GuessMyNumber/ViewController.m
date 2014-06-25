//
//  ViewController.m
//  GuessMyNumber
//
//  Created by Emrah on 25.06.2014.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "GuessNumberModel.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *guessTV;
@property (weak, nonatomic) IBOutlet UITextField *guessTF;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[[GuessNumberModel sharedGuessNumberModel] beginNewGame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Actions
- (IBAction)guessTouch:(id)sender {
    if ([self checkGuess]) {
        
        NSMutableAttributedString *appendTxt = [[NSMutableAttributedString alloc] initWithAttributedString:[[GuessNumberModel sharedGuessNumberModel] guessNumber:self.guessTF.text]];
        
        NSMutableAttributedString *origTxt = [self.guessTV.attributedText mutableCopy];
        
        NSAttributedString* nl = [[NSAttributedString alloc] initWithString:@"\n" attributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
        
        [appendTxt appendAttributedString:nl];
        [appendTxt appendAttributedString:origTxt];
      
        self.guessTV.attributedText = appendTxt;
        self.guessTF.text = @"";
        [self.guessTF resignFirstResponder];
    }
}

#pragma mark Methods

- (BOOL)checkGuess {
    BOOL result = YES;
    // To Do : check guessed number
    return result;
}

- (void)generateGuessNumber {
    
}



@end
