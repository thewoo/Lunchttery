//
//  MenuViewController.m
//  Lunchttery
//
//  Created by Jorge Pardo on 27/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import "MenuViewController.h"
#import "DataManager.h"
#import "LunchRandomizerViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

@synthesize randomLunchButton;

#pragma mark IBActions.

-(IBAction)pushLunchRandomizer:(id)sender {
    
    LunchRandomizerViewController *lunch = [[LunchRandomizerViewController alloc] initWithNibName:@"LunchRandomizerViewController" bundle:nil];
    [self.navigationController pushViewController:lunch animated:YES];
}

#pragma mark ViewController's.

-(void)viewWillAppear:(BOOL)animated {
    
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [[DataManager Get] retrieveFood];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {}
    return self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
