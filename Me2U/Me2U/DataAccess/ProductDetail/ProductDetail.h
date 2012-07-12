//
//  ProductDetail.h
//  Me2U
//
//  Created by Le Quang Vinh on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductDetail : NSObject

@property (nonatomic, retain) NSString *linkToImgProduct;
@property (nonatomic, retain) NSString *titleProduct;
@property (nonatomic, retain) NSString *shopProduct;
@property (nonatomic, retain) NSString *priceProduct;
@property (nonatomic, retain) NSString *descriptionProduct;
@property (nonatomic, retain) NSString *manufacturerProduct;

- (id)init; 
@end
