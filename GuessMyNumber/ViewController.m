//  ViewController.m
//  GuessMyNumber
//
//  Created by Emrah on 25.06.2014.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.

#import "ViewController.h"
#import "GuessNumberModel.h"

@interface ViewController () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *guessTV;
@property (weak, nonatomic) IBOutlet UILabel *guessTF;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *numberButtons;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	//[[GuessNumberModel sharedGuessNumberModel] beginNewGame];
    [self.guessTF setUserInteractionEnabled:NO];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"NumberFound"
                                                      object:nil
                                                       queue:nil
                                                  usingBlock:^(NSNotification *note) {
                                                      [self performSegueWithIdentifier:@"gameCompletedUnwindSegue" sender:self];
                                                  }];
    [self.guessTV setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textViewDidChangeSelection:(UITextView *)textView {
    [textView scrollRangeToVisible:textView.selectedRange];
}

#pragma mark Actions
- (IBAction)deleteNumbTouch:(UIButton*)sender {
    if (self.guessTF.text.length > 0) {
        self.guessTF.text = [self.guessTF.text substringToIndex:self.guessTF.text.length-1];
    }
    
    for (UIButton* numbBtn in self.numberButtons) {
        BOOL setEnabled = YES;
        for (int i = 0; i < self.guessTF.text.length; i++) {
            if ([numbBtn.titleLabel.text isEqualToString:[self.guessTF.text substringWithRange:NSMakeRange(i, 1)]]) {
                setEnabled = NO;
            }
        }
        [numbBtn setEnabled:setEnabled];
    }
}

- (IBAction)numberTouch:(UIButton*)sender {
    if (self.guessTF.text.length < 4) {
        self.guessTF.text = [NSString stringWithFormat:@"%@%@",self.guessTF.text,sender.titleLabel.text];
        [sender setEnabled:NO];
    }
    
    if (self.guessTF.text.length > 3) {
        for (UIButton* numbBtn in self.numberButtons) {
            [numbBtn setEnabled:NO];
        }
    }
}

- (IBAction)guessTouch:(id)sender {
    if ([self checkGuess]) {
        
        NSMutableAttributedString *appendTxt = [[NSMutableAttributedString alloc] initWithAttributedString:[[GuessNumberModel sharedGuessNumberModel] guessNumber:self.guessTF.text]];
        
        NSMutableAttributedString *origTxt = [self.guessTV.attributedText mutableCopy];
        
        NSAttributedString* nl = [[NSAttributedString alloc] initWithString:@"\n" attributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
        
        [origTxt appendAttributedString:appendTxt];
        [origTxt appendAttributedString:nl];
        
        self.guessTV.attributedText = origTxt;
        self.guessTF.text = @"";
        
        for (UIButton* numbBtn in self.numberButtons) {
            [numbBtn setEnabled:YES];
        }
    }
    
}

- (void)beginNewGame
{
    self.guessTV.attributedText = nil;
    [[GuessNumberModel sharedGuessNumberModel] beginNewGame];
}

#pragma mark Methods

- (BOOL)checkGuess {
    BOOL result = YES;
    // To Do : check guessed number
    if (self.guessTF.text.length < 4) {
        result = NO;
    }
    return result;
}

- (void)generateGuessNumber {
    
}



@end
