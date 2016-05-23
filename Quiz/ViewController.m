//
//  ViewController.m
//  Quiz
//
//  Created by Ellen Mey on 5/20/16.
//  Copyright © 2016 Ellen Mey. All rights reserved.
//

#import "ViewController.h"
#import "quiz.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel * questionLabel;
@property (weak, nonatomic) IBOutlet UILabel * answer1Label;
@property (weak, nonatomic) IBOutlet UILabel * answer2Label;
@property (weak, nonatomic) IBOutlet UILabel * answer3Label;
@property (weak, nonatomic) IBOutlet UILabel * answer4Label;
@property (weak, nonatomic) IBOutlet UIButton * answer1Button;
@property (weak, nonatomic) IBOutlet UIButton * answer2Button;
@property (weak, nonatomic) IBOutlet UIButton * answer3Button;
@property (weak, nonatomic) IBOutlet UIButton * answer4Button;
@property (weak, nonatomic) IBOutlet UIImageView * beer1;
@property (weak, nonatomic) IBOutlet UIImageView * beer2;
@property (weak, nonatomic) IBOutlet UIImageView * beer3;
@property (weak, nonatomic) IBOutlet UIImageView * beer4;
@property (weak, nonatomic) IBOutlet UILabel * statusLabel;
@property (weak, nonatomic) IBOutlet UIButton * startButton;
@property (weak, nonatomic) IBOutlet UIButton * infoButton;
@property (assign, nonatomic) NSInteger answer;




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.quizIndex = 999;
    self.runningQuiz = [[quiz alloc]initWithQuiz:@"beers"];
    [self nextQuizItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)quizDone
{
    // add what to do when the quiz ends
    if (self.runningQuiz.correctCount) {
        self.statusLabel.text = [NSString stringWithFormat:@"Quiz Done - Score %lu%%", self.runningQuiz.quizCount / self.runningQuiz.correctCount];
    } else {
        self.statusLabel.text = @"Quiz Done - Score 0%";
    }
    [self.startButton setTitle:@"Try Again" forState:UIControlStateNormal];
    self.quizIndex = 999;
}

- (void)nextQuizItem {
    if (self.quizIndex == 999){
        self.quizIndex = 0;
        self.statusLabel.text = @"";
    } else if ((self.runningQuiz.quizCount-1) > self.quizIndex) {
        self.quizIndex++;
    } else {
        self.quizIndex = 0;
        self.statusLabel.text = @"";
    }
    if (self.runningQuiz.quizCount >= self.quizIndex + 1) {
        [self.runningQuiz nextQuestion: self.quizIndex];
        self.questionLabel.text = self.runningQuiz.beers;
        self.answer1Label.text = self.runningQuiz.ans1;
        self.answer2Label.text = self.runningQuiz.ans2;
        self.answer3Label.text = self.runningQuiz.ans3;
        self.answer4Label.text = self.runningQuiz.ans4;
    } else {
        self.quizIndex = 0;
        [self quizDone];
    }
    // Reset fields for next question
    self.answer1Label.backgroundColor = [UIColor colorWithRed:51/255.0 green:133/255.0 blue:238/255.0 alpha:1.0];
    self.answer2Label.backgroundColor = [UIColor colorWithRed:51/255.0 green:133/255.0 blue:238/255.0 alpha:1.0];
    self.answer3Label.backgroundColor = [UIColor colorWithRed:51/255.0 green:133/255.0 blue:238/255.0 alpha:1.0];
    self.answer4Label.backgroundColor = [UIColor colorWithRed:51/255.0 green:133/255.0 blue:238/255.0 alpha:1.0];
    
    self.answer1Button.hidden = NO;
    self.answer2Button.hidden = NO;
    self.answer3Button.hidden = NO;
    self.answer4Button.hidden = NO;
}
- (void) checkAnswer {
    if([self.runningQuiz checkQuestion:self.quizIndex forAnswer:_answer]){
        if (self.answer == 1){
            self.answer1Label.backgroundColor = [UIColor greenColor];
        } else if (self.answer == 2){
            self.answer2Label.backgroundColor = [UIColor greenColor];
        } else if (self.answer == 3){
            self.answer3Label.backgroundColor = [UIColor greenColor];
        } else if (self.answer == 4){
            self.answer4Label.backgroundColor = [UIColor greenColor];
        }
    } else {
        // I think there might be an issue here, looks like same conditions above
        if (self.answer == 1) {
            self.answer1Label.backgroundColor = [UIColor redColor];
        } else if (self.answer == 2) {
            self.answer2Label.backgroundColor = [UIColor redColor];
        } else if (self.answer == 3) {
            self.answer3Label.backgroundColor = [UIColor redColor];
        } else if (self.answer == 4) {
            self.answer4Label.backgroundColor = [UIColor redColor];
        }
    }
    self.statusLabel.text = [NSString stringWithFormat:@"Correct: %lu Incorrect: %lu", self.runningQuiz.correctCount, self.runningQuiz.incorrectCount];
    
    self.answer1Button.hidden = YES;
    self.answer2Button.hidden = YES;
    self.answer3Button.hidden = YES;
    self.answer4Button.hidden = YES;
    
    self.startButton.hidden = NO;
    
    [self.startButton setTitle:@"Next" forState:UIControlStateNormal];
}
    - (IBAction)ans1Action:(id)sender
    {
        self.answer = 1;
        [self checkAnswer];
    }
    - (IBAction)ans2Action:(id)sender
    {
        self.answer = 2;
        [self checkAnswer];
    }
    - (IBAction)ans3Action:(id)sender
    {
        self.answer = 3;
        [self checkAnswer];
    }
    - (IBAction)ans4Action:(id)sender
    {
        self.answer = 4;
        [self checkAnswer];
    }
    - (IBAction)startAgain:(id)sender
    {
        [self nextQuizItem];
    }
    
    
@end
