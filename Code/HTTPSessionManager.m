//
//  HTTPSessionManager.m
//  PokeSnipers
//
//  Created by zzd on 16/8/1.
//  Copyright © 2016年 philamlife. All rights reserved.
//

#import "HTTPSessionManager.h"

#import <AFHTTPSessionManager.h>

@interface HTTPSessionManager ()
@property (strong, nonatomic) AFHTTPSessionManager *manager;
@end

@implementation HTTPSessionManager

SINGLETON_FOR_CLASS

- (AFHTTPSessionManager *)manager {
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
        _manager.requestSerializer.timeoutInterval = 10.0;
    }
    return _manager;
}

+ (void)getPokemonListSuccess:(void (^)(PokemonList *list))success failure:(void (^)(NSString *errorMsg))failure {
    [[HTTPSessionManager getInstance].manager GET:pokeSnipersAPI parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        PokemonList *list = [PokemonList mj_objectWithKeyValues:responseObject];
        if (success) {
            success(list);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error.localizedDescription);
        }
    }];
}

@end
