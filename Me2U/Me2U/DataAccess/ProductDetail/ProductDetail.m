//
//  ProductDetail.m
//  Me2U
//
//  Created by Le Quang Vinh on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProductDetail.h"

@implementation ProductDetail

@synthesize shopProduct;
@synthesize priceProduct;
@synthesize titleProduct;
@synthesize linkToImgProduct;
@synthesize descriptionProduct;
@synthesize manufacturerProduct;
@synthesize typeProduct;

- (id)init {
    self = [super init];
	if (self) {

	}
	return self;
}

- (id)initWithShop:(NSString*)shop withPrice:(float)price withTitle:(NSString*)title withImgURL:(NSString*)imgUrl withDescription:(NSString*)description andManufacturer:(NSString*)manufaturer
{
    self = [super init];
	if (self) {
        self.shopProduct = shop;
        self.priceProduct = price;
        self.titleProduct = title;
        self.linkToImgProduct = imgUrl;
        self.descriptionProduct = description;
        self.manufacturerProduct = manufaturer;
	}
	return self;
}

@end
