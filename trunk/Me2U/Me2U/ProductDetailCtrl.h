//
//  ProductDetailCtrl.h
//  Me2U
//
//  Created by duong2179 on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductDetail.h"

@interface ProductDetailCtrl : UIViewController

@property (nonatomic, retain) IBOutlet UILabel *lblTitleProduct;
@property (nonatomic, retain) IBOutlet UIImageView *imvImgProduct;
@property (nonatomic, retain) IBOutlet UILabel *lblShop;
@property (nonatomic, retain) IBOutlet UILabel *lblManufacturer;
@property (nonatomic, retain) IBOutlet UILabel *lblPrice;
@property (nonatomic, retain) IBOutlet UITextView *txvDescription;
@property (nonatomic, retain) IBOutlet UIButton *btnAddFavourite;
@property (nonatomic, retain) IBOutlet UIButton *btnAddBasket;

@property (nonatomic, retain) ProductDetail *product;

- (id)initWithProductDetail:(ProductDetail*)productTemp;

@end
