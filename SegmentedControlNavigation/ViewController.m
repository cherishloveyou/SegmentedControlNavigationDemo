//
//  ViewController.m
//  SegmentedControlNavigation
//
//  Created by LiuXiangjin on 5/30/14.
//  Copyright (c) 2014 JeOam. All rights reserved.
//

#import "ViewController.h"
#import "SegmentedControl.h"

#import "RecordViewController.h"
#import "KnowledgeViewController.h"
#import "ExploreViewController.h"

@interface ViewController ()
@property (nonatomic, strong) RecordViewController *recordView;
@property (nonatomic, strong) KnowledgeViewController *knowledgeView;
@property (nonatomic, strong) ExploreViewController *exploreView;
@property (nonatomic, strong) NSArray *viewsControllers;
@property (nonatomic, assign) NSInteger lastSelectedSegmentIndex;
@end

@implementation ViewController

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
    // Do any additional setup after loading the view.
    
    SegmentedControl *segmentedControl = [[SegmentedControl alloc] init];
    [segmentedControl addTarget:self action:@selector(typeAction:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = segmentedControl;
    
    
    self.recordView = [[RecordViewController alloc] init];
    self.recordView.view.frame = self.view.bounds;
    [self.view addSubview:self.recordView.view];
    
    self.knowledgeView = [[KnowledgeViewController alloc] init];
    self.knowledgeView.view.frame = self.view.bounds;
    [self.view addSubview:self.knowledgeView.view];
    
    self.exploreView = [[ExploreViewController alloc] init];
    self.exploreView.view.frame = self.view.bounds;
    [self.view addSubview:self.exploreView.view];
    
    self.viewsControllers = @[self.recordView, self.knowledgeView, self.exploreView];
    
    segmentedControl.selectedSegmentIndex = 1;
    self.lastSelectedSegmentIndex = segmentedControl.selectedSegmentIndex;
    
    self.recordView.view.hidden = YES;
    self.knowledgeView.view.hidden = NO;
    self.exploreView.view.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) typeAction:(SegmentedControl *) sender{
    NSLog(@"ViewController typeAction:");
    [self transitionFrom:self.lastSelectedSegmentIndex to:sender.selectedSegmentIndex];
    self.lastSelectedSegmentIndex = sender.selectedSegmentIndex;
}

-(void)transitionFrom:(NSInteger)from to:(NSInteger)to{
    CATransition *transition = [[CATransition alloc] init];
    transition.type = kCATransitionPush;
    transition.subtype = from > to ? kCATransitionFromLeft : kCATransitionFromRight;
    
    UIViewController *currentSegmentedView = (UIViewController *)self.viewsControllers[from];
    UIViewController *nextSegmentedView = (UIViewController *)self.viewsControllers[to];
    
    [currentSegmentedView.view.layer addAnimation:transition forKey:@"transition"];
    [nextSegmentedView.view.layer addAnimation:transition forKey:@"transition"];
    
    currentSegmentedView.view.hidden = YES;
    nextSegmentedView.view.hidden = NO;
}

@end
