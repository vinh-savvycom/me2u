//
//  Product.h
//  Me2U
//
//  Created by duong2179 on 7/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Product : NSManagedObject

@property (nonatomic, retain) NSNumber * id_product;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * id_parent;
@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSString * descriptions;
@property (nonatomic, retain) NSNumber * quantity;
@property (nonatomic, retain) NSString * model;
@property (nonatomic, retain) NSNumber * price;

@end
