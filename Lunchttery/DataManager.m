//
//  DataManager.m
//  Lunchttery
//
//  Created by Jorge Pardo on 27/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import "DataManager.h"
#import "SBJson.h"


static DataManager *instance = nil;

@implementation DataManager

@synthesize foodDictionary;


#pragma mark Actions.

-(void)retrieveFood {
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://81.18.24.170:7171/Lunchttery/Lunchttery.txt"];
    NSString *rawFood = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    
    self.foodDictionary = [rawFood JSONValue];
}

#pragma mark Singleton's.

+(DataManager *)Get {
    
    if (instance == nil) {
        instance = [[DataManager alloc] init];
    }
    
    return instance;
}

@end
