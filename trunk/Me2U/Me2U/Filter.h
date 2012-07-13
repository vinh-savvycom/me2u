//
//  Filter.h
//  Me2U
//
//  Created by duong2179 on 7/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Filter : NSManagedObject

@property (nonatomic, retain) NSNumber * id_filter;
@property (nonatomic, retain) NSString * name;

@end
