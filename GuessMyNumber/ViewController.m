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
@property (nonatomic, strong) GuessNumberModel *guessNumberModel;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Actions
- (IBAction)guessTouch:(id)sender {
    [self.guessNumberModel.sharedGuessNumberModel
    
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
