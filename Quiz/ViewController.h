//
//  ViewController.h
//  Quiz
//
//  Created by Ellen Mey on 5/20/16.
//  Copyright © 2016 Ellen Mey. All rights reserved.
//

#import <UIKit/UIKit.h>


@class quiz;
@interface ViewController : UIViewController

-(IBAction)ans1Action:(id)sender;
-(IBAction)ans2Action:(id)sender;
-(IBAction)ans3Action:(id)sender;
-(IBAction)ans4Action:(id)sender;
-(IBAction)startAgain:(id)sender;

@property (nonatomic, assign) NSInteger quizIndex;
@property (nonatomic, strong) quiz * runningQuiz;


@end

