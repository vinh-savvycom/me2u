//
//  AppDelegate.h
//  Me2U
//
//  Created by duong2179 on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SplashScreenCtrl.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (retain, nonatomic) UINavigationController *rootNavCtrl;
@property (retain, nonatomic) SplashScreenCtrl* splashCtrl;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
