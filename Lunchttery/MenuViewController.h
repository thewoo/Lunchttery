//
//  MenuViewController.h
//  Lunchttery
//
//  Created by Jorge Pardo on 27/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIButton *randomLunchButton;

-(IBAction)pushLunchRandomizer:(id)sender;

@end
