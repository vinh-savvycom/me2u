//
//  DataAccessProcess.h
//  Me2U
//
//  Created by duong2179 on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductDetail.h"
#import "Category.h"
#import <CoreData/CoreData.h>

@interface DataAccessProcess : NSObject <NSFetchedResultsControllerDelegate>

@property (nonatomic, retain) NSFetchedResultsController* personFRC;

- (NSMutableArray*)getDataForCategoryOfStoreSearch;
- (NSMutableArray*)getDataForSpecialFemaleOfStoreSearch;
- (NSMutableArray*)getDataForSpecialMaleOfStoreSearch;
- (NSMutableArray*)getDataForMaleFriendOfStoreSearch;
- (NSMutableArray*)getDataForFemaleFriendOfStoreSearch;
- (NSMutableArray*)getDataForValentinesOfStoreSearch;
- (NSMutableArray*)getDataForMotherDayOfStoreSearch;
- (NSMutableArray*)getDataForFatherDayOfStoreSearch;
- (NSMutableArray*)getDataForGiftType;
- (NSMutableArray*)getDataForPrice;

//NEW NEW
//NEW NEW
- (NSManagedObjectContext *) managedObjectContext;
- (NSMutableArray*)getCategoriesFromDB;

@end
