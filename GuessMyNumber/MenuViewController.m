//
//  MenuViewController.m
//  GuessMyNumber
//
//  Created by Emrah on 26.06.2014.
//  Copyright (c) 2014 Emrah. All rights reserved.
//

#import "MenuViewController.h"
#import "GuessNumberModel.h"
#import "ViewController.h"

@interface MenuViewController ()
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark Actions

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[ViewController class]]) {
        ViewController *mvc = (ViewController *)segue.destinationViewController;
        [mvc beginNewGame];
    }

}

- (IBAction)doneHowToplay:(UIStoryboardSegue*)sender {
    [self.resultLabel setText:@""];
}

- (IBAction)gameCompleted:(UIStoryboardSegue*)sender {
    NSString* try;
    if ([[GuessNumberModel sharedGuessNumberModel] guessCount] < 2) {
        try = @"try";
    } else {
        try = @"tries";
    }

    [self.resultLabel setText:[NSString stringWithFormat:@"Congratulation you have guessed the number : %@ within %d %@",[[GuessNumberModel sharedGuessNumberModel] guessNumber],[[GuessNumberModel sharedGuessNumberModel] guessCount],try]];
}

@end
