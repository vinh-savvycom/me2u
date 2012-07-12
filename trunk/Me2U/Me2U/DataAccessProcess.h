//
//  DataAccessProcess.h
//  Me2U
//
//  Created by duong2179 on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataAccessProcess : NSObject

- (NSMutableArray*)getDataForCategoryOfStoreSearch;
- (NSMutableArray*)getDataForSpecialFemaleOfStoreSearch;
- (NSMutableArray*)getDataForSpecialMaleOfStoreSearch;
- (NSMutableArray*)getDataForMaleFriendOfStoreSearch;
- (NSMutableArray*)getDataForFemaleFriendOfStoreSearch;
- (NSMutableArray*)getDataForValentinesOfStoreSearch;
- (NSMutableArray*)getDataForMotherDayOfStoreSearch;
- (NSMutableArray*)getDataForFatherDayOfStoreSearch;
@end
