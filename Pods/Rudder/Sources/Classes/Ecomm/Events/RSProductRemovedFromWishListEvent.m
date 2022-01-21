//
//  ProductRemovedFromWishListEvent.m
//  RSSDKCore
//
//  Created by Arnab Pal on 22/01/20.
//

#import "RSProductRemovedFromWishListEvent.h"
#import "RSECommerceParamNames.h"

@implementation ProductRemovedFromWishListEvent

- (instancetype)withWishList:(RSECommerceWishList *)wishList {
    _wishList = wishList;
    return self;
}

- (instancetype)withProduct:(RSECommerceProduct *)product {
    _product = product;
    return self;
}

- (NSString *)event {
    return ECommProductRemovedFromWishList;
}

- (NSDictionary *)properties {
    NSMutableDictionary *tempDict = [[NSMutableDictionary alloc] init];
    
    if (_product != nil) {
        [tempDict setDictionary:[_product dict]];
    }
    
    if (_wishList != nil) {
        [tempDict setValue:_wishList.wishListId forKey:KeyWishlistId];
        [tempDict setValue:_wishList.wishListName forKey:KeyWishlistName];
    }
    
    return [tempDict copy];
}

@end
