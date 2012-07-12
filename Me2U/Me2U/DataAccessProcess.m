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
    NSArray *arrOfImgUrl = [[NSArray alloc] initWithObjects:@"flower01.jpeg", @"flower02.jpeg", @"flower03.jpeg", @"flower04.jpeg", @"flower05.jpeg", @"flower01.jpeg", @"flower02.jpeg", @"flower03.jpeg", @"flower04.jpeg", @"flower05.jpeg", nil];
    NSArray *arrOfManufacturer = [[NSArray alloc] initWithObjects:@"Tran Anh", @"Phuc Anh", @"Lenovo", @"Asus Tek", @"Apple Inc.", @"Microsoft", @"Google Inc", @"Facebook", @"Foxconn", @"Samsung", nil];
    
    ProductDetail* product;
    
    NSString *strDes = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";
    
    for (int i=0; i<10; i++) {
        product = [[ProductDetail alloc] initWithShop:[arrOfShops objectAtIndex:i] withPrice:[[arrOfPrice objectAtIndex:i] floatValue] withTitle:[arrOfTitle objectAtIndex:i] withImgURL:[arrOfImgUrl objectAtIndex:i] withDescription:strDes andManufacturer:[arrOfManufacturer objectAtIndex:i]];
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

- (NSMutableArray*)getDataForPrice{
    NSMutableArray* arr = [[NSMutableArray alloc] init];
    
    NSArray *arrayTypeStyle = [[NSArray alloc] initWithObjects:@"Quan ao", @"Giay dep", @"Giay dep", nil];
    
    NSArray *arrayTypeDoDung = [[NSArray alloc] initWithObjects:@"May tinh", @"Sach vo", nil];
    
    NSArray *arrayTypeVoVan = [[NSArray alloc] initWithObjects:@"Coc chen", @"Hoa", nil];
    
    NSMutableDictionary *dicStyle = [NSMutableDictionary dictionary];
    NSMutableDictionary *dicDodung = [NSMutableDictionary dictionary];
    NSMutableDictionary *dicVoVan = [NSMutableDictionary dictionary];
    
    [dicStyle setValue:arrayTypeStyle forKey:@"0"];
    [dicDodung setValue:arrayTypeDoDung forKey:@"1"];
    [dicVoVan setValue:arrayTypeVoVan forKey:@"2"];
    
    
    [arr addObject:dicStyle];
    [arr addObject:dicDodung];
    [arr addObject:dicVoVan];
    
    return arr;
}

- (NSMutableArray*)getDataForGiftType {
    
    NSMutableArray* arr = [[NSMutableArray alloc] init];
    
    NSArray *arrayTypeStyle = [[NSArray alloc] initWithObjects:@"Quan ao", @"Giay dep", @"Giay dep", nil];
    
    NSArray *arrayTypeDoDung = [[NSArray alloc] initWithObjects:@"May tinh", @"Sach vo", @"Hoa", @"Coc chen", nil];
    
    NSMutableDictionary *dicStyle = [NSMutableDictionary dictionary];
    NSMutableDictionary *dicDodung = [NSMutableDictionary dictionary];
    
    [dicStyle setValue:arrayTypeStyle forKey:@"0"];
    [dicDodung setValue:arrayTypeDoDung forKey:@"1"];
    
    [arr addObject:dicStyle];
    [arr addObject:dicDodung];
    
    return arr;

}



@end
