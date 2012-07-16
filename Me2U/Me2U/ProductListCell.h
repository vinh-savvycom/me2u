//
//  ProductListCell.h
//  Me2U
//
//  Created by duong2179 on 7/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductListCell : UITableViewCell

@property (nonatomic, retain) IBOutlet UIImageView *imvLogo;
@property (nonatomic, retain) IBOutlet UILabel *lblProductName;
@property (nonatomic, retain) IBOutlet UILabel *lblProductModel;
@property (nonatomic, retain) IBOutlet UILabel *lblProductPrice;
@property (nonatomic, retain) IBOutlet UILabel *lblProductQuantity;
@property (nonatomic, retain) IBOutlet UITextView *txvProductDescription;

@end
