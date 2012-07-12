//
//  DataAccessProcess.m
//  Me2U
//
//  Created by duong2179 on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DataAccessProcess.h"

@implementation DataAccessProcess

- (NSMutableArray*)getDataForCategoryOfStoreSearch
{
    NSMutableArray* arr = [[NSMutableArray alloc] init];
    
    NSArray *arrOfShops = [[NSArray alloc] initWithObjects:@"70 Thai Ha", @"20 Chua Boc", @"51 Pham Ngoc Thach", @"60 Le Trong Tan", @"70 Hai Ba Trung", @"70 Thai Ha", @"20 Chua Boc", @"51 Pham Ngoc Thach", @"60 Le Trong Tan", @"70 Hai Ba Trung", nil];
    NSArray *arrOfPrice = [[NSArray alloc] initWithObjects:[NSNumber numberWithFloat:20.0], [NSNumber numberWithFloat:20.0], [NSNumber numberWithFloat:20.0], [NSNumber numberWithFloat:20.0], [NSNumber numberWithFloat:20.0], [NSNumber numberWithFloat:20.0], [NSNumber numberWithFloat:20.0], [NSNumber numberWithFloat:20.0], [NSNumber numberWithFloat:20.0], [NSNumber numberWithFloat:20.0], nil];
    NSArray *arrOfTitle = [[NSArray alloc] initWithObjects:@"Quan ao", @"Giay dep", @"Hoa", @"May tinh", @"Sach vo", @"Coc chen", @"Giay dep", @"Hoa", @"May tinh", @"Sach vo", nil];
    NSArray *arrOfImgUrl = [[NSArray alloc] initWithObjects:@"flower01.jpeg", @"flower02.jpeg", @"flower03.jpeg", @"flower04.jpeg", @"flower05.jpeg", @"flower01.jpeg", @"flower02.jpg", @"flower03.jpg", @"flower04.jpg", @"flower05.jpg", nil];
    
    ProductDetail* product;
    
    for (int i=0; i<10; i++) {
        product = [[ProductDetail alloc] initWithShop:[arrOfShops objectAtIndex:i] withPrice:[[arrOfPrice objectAtIndex:i] floatValue] withTitle:[arrOfTitle objectAtIndex:i] withImgURL:[arrOfImgUrl objectAtIndex:i] withDescription:nil andManufacturer:nil];
        [arr addObject:product];
        [product release];
        product = nil;
    }
    
    return arr;
}

- (NSMutableArray*)getDataForSpecialFemaleOfStoreSearch
{
    return nil;
}

- (NSMutableArray*)getDataForSpecialMaleOfStoreSearch
{
    return nil;
}

- (NSMutableArray*)getDataForMaleFriendOfStoreSearch
{
    return nil;
}

- (NSMutableArray*)getDataForFemaleFriendOfStoreSearch
{
    return nil;
}

- (NSMutableArray*)getDataForValentinesOfStoreSearch
{
    return nil;
}

- (NSMutableArray*)getDataForMotherDayOfStoreSearch
{
    return nil;
}

- (NSMutableArray*)getDataForFatherDayOfStoreSearch
{
    return nil;
}

@end
