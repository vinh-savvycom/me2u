//
//  Basket.h
//  Me2U
//
//  Created by duong2179 on 7/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Basket : NSManagedObject

@property (nonatomic, retain) NSNumber * id_product;
@property (nonatomic, retain) NSNumber * quantity;

@end
