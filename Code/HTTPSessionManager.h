//
//  HTTPSessionManager.h
//  PokeSnipers
//
//  Created by zzd on 16/8/1.
//  Copyright © 2016年 philamlife. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PokemonList.h"

@interface HTTPSessionManager : NSObject

+ (void)getPokemonListSuccess:(void (^)(PokemonList *list))success failure:(void (^)(NSString *errorMsg))failure;

@end
