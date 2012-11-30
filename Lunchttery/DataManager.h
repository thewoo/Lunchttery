//
//  DataManager.h
//  Lunchttery
//
//  Created by Jorge Pardo on 27/11/12.
//  Copyright (c) 2012 Magic Dealers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

@property (nonatomic, strong) NSMutableDictionary *foodDictionary;

-(void)retrieveFood;

+(DataManager *)Get;

@end
