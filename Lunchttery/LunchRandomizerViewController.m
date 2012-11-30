//
//  LunchRandomizerViewController.m
//  Lunchttery
//
//  Created by Jorge Pardo on 27/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import "LunchRandomizerViewController.h"
#import "DataManager.h"

@interface LunchRandomizerViewController ()

@end

@implementation LunchRandomizerViewController

@synthesize vegetarianSwitch;

@synthesize mainIngredientsTableView;
@synthesize mainIngredientsArray;

@synthesize secondaryIngredientsTableView;
@synthesize secondaryIngredientsArray;

@synthesize minorIngredientsTableView;
@synthesize minorIngredientsArray;

@synthesize randomizeLunch;


#pragma mark IBActions.

-(IBAction)randomizeLunch:(id)sender {
    
    [self selectRow:mainIngredientsTableView withRandomNumber:(arc4random() % [mainIngredientsArray count])];
    [self selectRow:secondaryIngredientsTableView withRandomNumber:(arc4random() % [secondaryIngredientsArray count])];
    [self selectRow:minorIngredientsTableView withRandomNumber:(arc4random() % [minorIngredientsArray  count])];
}


#pragma mark Actions.

-(void)loadFoodArrays {
    
    NSString *foodSissy = @"";
    
    if ([vegetarianSwitch isOn]) {
        foodSissy = @"vegetarian";
    }
    
    self.mainIngredientsArray = [[[DataManager Get] foodDictionary] objectForKey:[NSString stringWithFormat:@"%@mainIngredients", foodSissy]];
    self.secondaryIngredientsArray = [[[DataManager Get] foodDictionary] objectForKey:[NSString stringWithFormat:@"%@secondaryIngredients", foodSissy]];
    self.minorIngredientsArray = [[[DataManager Get] foodDictionary]objectForKey:[NSString stringWithFormat:@"%@minorIngredients", foodSissy]];
    
}

-(void)switchChanged:(UISwitch *)UISwitch {
    
    [self loadFoodArrays];
    
    [self.mainIngredientsTableView reloadData];
    [self.secondaryIngredientsTableView reloadData];
    [self.minorIngredientsTableView reloadData];
    
}

-(void)selectRow:(UITableView *)tableView withRandomNumber:(NSInteger)randomNumber {
        
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:randomNumber inSection:0];
    [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    
}

-(void)deselectRow:(UITableView *)tableView withRowNumber:(NSInteger)rowNumber {
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:rowNumber inSection:0];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}



#pragma mark UITableView's Delegate & DataSource.

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSInteger numberOfRows = 0;
    
    if (tableView == self.mainIngredientsTableView) {
        numberOfRows = [mainIngredientsArray count];
        
    } else if (tableView == secondaryIngredientsTableView) {
        numberOfRows = [secondaryIngredientsArray count];
        
    } else if (tableView == minorIngredientsTableView) {
        numberOfRows = [minorIngredientsArray count];
    }
    
    return numberOfRows;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    if (tableView == mainIngredientsTableView) {
        cell.textLabel.text = [mainIngredientsArray objectAtIndex:[indexPath row]];
        
    } else if (tableView == secondaryIngredientsTableView) {
        cell.textLabel.text = [secondaryIngredientsArray objectAtIndex:[indexPath row]];
        
    } else if (tableView == minorIngredientsTableView) {
        cell.textLabel.text = [minorIngredientsArray objectAtIndex:[indexPath row]];
        
    }
    
    return cell;
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil; 
}


#pragma mark ViewController's.

-(void)viewWillAppear:(BOOL)animated {
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self loadFoodArrays];
    
    [self.vegetarianSwitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {}
    return self;
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
