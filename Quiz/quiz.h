//
//  quiz.h
//  Quiz
//
//  Created by Ellen Mey on 5/20/16.
//  Copyright © 2016 Ellen Mey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface quiz : NSObject

@property (nonatomic, strong) NSMutableArray * breweryArray;
@property (nonatomic, assign) NSInteger correctCount;
@property (nonatomic, assign) NSInteger incorrectCount;
@property (nonatomic, assign) NSInteger quizCount;
@property (nonatomic, readonly, strong) NSString * beers;
@property (nonatomic, readonly, strong) NSString * ans1;
@property (nonatomic, readonly, strong) NSString * ans2;
@property (nonatomic, readonly, strong) NSString * ans3;
@property (nonatomic, readonly, strong) NSString * ans4;

-(id)initWithQuiz:(NSString*)plistName;
-(void) nextQuestion: (NSUInteger) idx;
-(BOOL) checkQuestion: (NSUInteger) question forAnswer: (NSUInteger) answer;

@end
