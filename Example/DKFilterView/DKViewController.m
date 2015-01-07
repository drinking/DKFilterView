//
//  DKViewController.m
//  DKFilterView
//
//  Created by Drinking on 01/07/2015.
//  Copyright (c) 2014 Drinking. All rights reserved.
//

#import "DKViewController.h"
#import <DKFilterView/DKFilterView.h>

@interface DKViewController ()<DKFilterViewDelegate,UIAlertViewDelegate>

@property (nonatomic,strong) DKFilterView *filterView;
@property (nonatomic,strong) DKFilterModel *clickModel;
@end

@implementation DKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.filterView = [[DKFilterView alloc] initWithFrame:self.view.frame];
    self.filterView.delegate = self;
    
    NSArray *filterData =  @[@"Apple",@"Pear",@"Mango",@"Orange",@"Lychee",@"Coconut"];
    DKFilterModel *model = [[DKFilterModel alloc] initElement:filterData ofType:DK_SELECTION_SINGLE];
    model.title = @"Click";
    model.style = DKFilterViewStyle1;
    self.clickModel = model;
    
    filterData = @[@"Red",@"Yellow",@"Green",@"Pink",@"White",@"Black"];
    DKFilterModel *radioModel = [[DKFilterModel alloc] initElement:filterData ofType:DK_SELECTION_SINGLE];
    radioModel.title = @"Single Selection";
    radioModel.style = DKFilterViewDefault;
    
    filterData = @[@"1",@"2",@"3",@"4",@"5",@"6"];
    DKFilterModel *checkModel = [[DKFilterModel alloc] initElement:filterData ofType:DK_SELECTION_MULTIPLE];
    checkModel.title = @"Multiple Selection";
    checkModel.style = DKFilterViewDefault;
    
    DKFilterModel *pickModel = [[DKFilterModel alloc] initElement:@[DK_ADD,DK_ADD,DK_ADD]
                                                           ofType:DK_SELECTION_PICK];
    pickModel.choices = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L"];
    pickModel.title = @"Pick Selection ";
    
    [self.filterView setFilterModels:@[model,radioModel,checkModel,pickModel]];
    
    [self.view addSubview:self.filterView];
    
    
    
    CGFloat width = CGRectGetWidth([UIScreen mainScreen].bounds);
    CGFloat originY = CGRectGetHeight([UIScreen mainScreen].bounds) -44;
    UIButton *filterButton = [[UIButton alloc] initWithFrame:CGRectMake(0, originY, width, 44)];
    filterButton.backgroundColor = DK_HL_COLOR;
    [filterButton setTitle:@"filter" forState:UIControlStateNormal];
    [filterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [filterButton addTarget:self action:@selector(filter:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:filterButton];
}




- (void)didClickAtModel:(DKFilterModel *)data{
    if (data == _clickModel) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"you click" message:data.clickedButtonText delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (void)filter:(id)sender {
    NSString *result = @"";
    for (DKFilterModel *model in self.filterView.filterModels) {
        if(model == self.clickModel){
            continue;
        }
        
        result = [result stringByAppendingFormat:@"Title:%@\n",model.title];
        NSArray *array = [model getFilterResult];
        for (NSString *str in array) {
            result = [result stringByAppendingFormat:@"[%@]",str];
        }
        result = [result stringByAppendingString:@"\n"];
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"filter result" message:result delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
    [alert show];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
