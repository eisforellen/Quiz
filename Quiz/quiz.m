//
//  quiz.m
//  Quiz
//
//  Created by Ellen Mey on 5/20/16.
//  Copyright © 2016 Ellen Mey. All rights reserved.
//

#import "quiz.h"

@interface quiz()
    @property (nonatomic, strong) NSString * beers;
    @property (nonatomic, strong) NSString * ans1;
    @property (nonatomic, strong) NSString * ans2;
    @property (nonatomic, strong) NSString * ans3;
    @property (nonatomic, strong) NSString * ans4;
@end

@implementation quiz

-(id)initWithQuiz:(NSString *)plistName
{
    if((self =[super init]))
    {
        NSString *plistCatPath = [[NSBundle mainBundle]pathForResource:plistName ofType:@"plist"];
        self.breweryArray = [NSMutableArray arrayWithContentsOfFile:plistCatPath];
        self.quizCount = [self.breweryArray count];
    }
    return self;
}
- (void) nextQuestion: (NSUInteger) idx
{
    self.beers = [NSString stringWithFormat:@"'%@'",self.breweryArray[idx][@"beers"]];
    
    self.ans1 = self.breweryArray[idx][@"ans1"];
    self.ans2 = self.breweryArray[idx][@"ans2"];
    self.ans3 = self.breweryArray[idx][@"ans3"];
    self.ans4 = self.breweryArray[idx][@"ans4"];
    
    if (idx == 0){
        self.correctCount = 0;
        self.incorrectCount = 0;
    }
}
- (BOOL) checkQuestion:(NSUInteger)question forAnswer:(NSUInteger)answer
{
    NSString * ans = self.breweryArray[question] [@"answer"];
    if ([ans intValue] == answer) {
        self.correctCount++;
        return YES;
    } else {
        self.incorrectCount++;
        return NO;
    }
}

@end
