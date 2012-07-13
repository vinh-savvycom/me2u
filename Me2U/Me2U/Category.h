//
//  Category.h
//  Me2U
//
//  Created by duong2179 on 7/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Category : NSManagedObject

@property (nonatomic, retain) NSNumber * id_category;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSNumber * total_product;

@end
