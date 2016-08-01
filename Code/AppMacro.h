//
//  AppMacro.h
//  PokeSnipers
//
//  Created by zzd on 16/8/1.
//  Copyright © 2016年 philamlife. All rights reserved.
//

#pragma mark - SingletonMacro

#define SINGLETON_FOR_HEADER \
\
+ (instancetype)getInstance;


#define SINGLETON_FOR_CLASS \
\
+ (instancetype)getInstance { \
static id instance = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
instance = [[self alloc] init]; \
}); \
return instance; \
}

static NSString *const pokeSnipersAPI = @"http://pokesnipers.com/api/v1/pokemon.json";
