//
//  SegmentedControl.m
//  SegmentedControlNavigation
//
//  Created by LiuXiangjin on 5/30/14.
//  Copyright (c) 2014 JeOam. All rights reserved.
//

#import "SegmentedControl.h"

@implementation SegmentedControl{
    // 这里假设要分三个栏目：记录、学习、发现，分别对应一个 ViewController
    NSArray *buttons;
    UIButton *recordButton; // 记录 按钮
    UIButton *knowledgeButton; // 学习 按钮
    UIButton *exploreButton; // 发现 按钮
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initialize]; //调用自定义的方法
    }
    return self;
}

- (id)init {
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}


-(void)initialize{
    recordButton = [[UIButton alloc] init];
    [recordButton setBackgroundImage:[UIImage imageNamed:@"recordButtonBg"]
                            forState:UIControlStateNormal];
    [recordButton setBackgroundImage:[UIImage imageNamed:@"recordButtonBgActive"]
                            forState:UIControlStateSelected];
    recordButton.frame = CGRectMake(0, 0, 54, 32);
    [self addSubview:recordButton];
    
    knowledgeButton = [[UIButton alloc] init];
    [knowledgeButton setBackgroundImage:[UIImage imageNamed:@"knowledgeButtonBg"]
                               forState:UIControlStateNormal];
    [knowledgeButton setBackgroundImage:[UIImage imageNamed:@"knowledgeButtonBgActive"]
                               forState:UIControlStateSelected];
    knowledgeButton.frame = CGRectMake(54, 0, 54, 32);
    [self addSubview:knowledgeButton];
    
    exploreButton = [[UIButton alloc] init];
    [exploreButton setBackgroundImage:[UIImage imageNamed:@"exploreButtonBg"]
                             forState:UIControlStateNormal];
    [exploreButton setBackgroundImage:[UIImage imageNamed:@"exploreButtonBgActive"]
                             forState:UIControlStateSelected];
    exploreButton.frame = CGRectMake(108, 0, 54, 32);
    [self addSubview:exploreButton];
    
    [recordButton addTarget:self action:@selector(touchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];
    [knowledgeButton addTarget:self action:@selector(touchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];
    [exploreButton addTarget:self action:@selector(touchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];
    
    buttons = @[recordButton, knowledgeButton, exploreButton];
    
    self.selectedSegmentIndex = UISegmentedControlNoSegment;
    
    [self sizeToFit];
    
    NSLog(@"SegmentedControl initialize");
}

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake(162, 32);
}

- (void)touchUpInsideAction:(UIButton *)button {
    NSLog(@"SegmentedControl touchUpInsideAction");
    for (UIButton *button in buttons) {
        button.selected = NO;
    }
    button.selected = YES;
    NSInteger index = [buttons indexOfObject:button];
    if (self.selectedSegmentIndex != index) {
        self.selectedSegmentIndex = index;
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}

@end

