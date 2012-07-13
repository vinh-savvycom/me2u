//
//  CatetoryPickerView.h
//  Me2U
//
//  Created by duong2179 on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "define.h"

@interface CatetoryPickerView : UIView<UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, retain) NSMutableArray *arrOfCategory;
@property (nonatomic, retain) NSArray *arrOfType;
@property (nonatomic, retain) UIViewController *storeCtrl;

@end
