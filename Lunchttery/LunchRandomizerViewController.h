//
//  LunchRandomizerViewController.h
//  Lunchttery
//
//  Created by Jorge Pardo on 27/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LunchRandomizerViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UISwitch *vegetarianSwitch;

@property (nonatomic, strong) IBOutlet UITableView *mainIngredientsTableView;
@property (nonatomic, strong) NSMutableArray *mainIngredientsArray;

@property (nonatomic, strong) IBOutlet UITableView *secondaryIngredientsTableView;
@property (nonatomic, strong) NSMutableArray *secondaryIngredientsArray;

@property (nonatomic, strong) IBOutlet UITableView *minorIngredientsTableView;
@property (nonatomic, strong) NSMutableArray *minorIngredientsArray;

@property (nonatomic, strong) IBOutlet UIButton *randomizeLunch;


-(IBAction)randomizeLunch:(id)sender;


@end
