//
//  FavoritesList.h
//  Fonts
//
//  Created by 冯尧 on 15/8/16.
//  Copyright (c) 2015年 Apress. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FavoritesList : NSObject

+ (instancetype)sharedFavoritesList;

- (NSArray *)favorites;

- (void)addFavorite:(id)item;
- (void)removeFavorite:(id)item;

- (void)moveItemAtIndex:(NSInteger)from toIndex:(NSInteger)to;

@end
