//
//  AppDelegate.h
//  CoreDateTest
//
//  Created by Madhusudan Reddy on 31/05/18.
//  Copyright © 2018 BlackCurrant Apps LLP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

