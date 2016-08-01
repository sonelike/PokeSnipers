//
//  Pokemon.h
//  PokeSnipers
//
//  Created by zzd on 16/8/1.
//  Copyright © 2016年 philamlife. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pokemon : NSObject

@property (strong, nonatomic) NSString *id;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *coords;
@property (strong, nonatomic) NSString *until;
@property (strong, nonatomic) NSString *icon;

@end
