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
@property (nonatomic, readwrite) float priceProduct;
@property (nonatomic, retain) NSString *descriptionProduct;
@property (nonatomic, retain) NSString *manufacturerProduct;
@property (nonatomic, retain) NSString *typeProduct;

- (id)init;
- (id)initWithShop:(NSString*)shop withPrice:(float)price withTitle:(NSString*)title withImgURL:(NSString*)imgUrl withDescription:(NSString*)description andManufacturer:(NSString*)manufaturer;
@end
