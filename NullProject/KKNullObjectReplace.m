//
//  KKNullObjectReplace.m
//  NullProject
//
//  Created by Kun on 25/03/2017.
//  Copyright © 2017 Kun. All rights reserved.
//

#import "KKNullObjectReplace.h"

@implementation KKNullObjectReplace



- (id)replaceNullObject:(id)response
{
    if ([response isKindOfClass:[NSDictionary class]]) {
        return [self replaceNullObjectForDictionary:response];
    }else if([response isKindOfClass:[NSArray class]]){
        return [self replaceNullObjectForArray:response];
    }else {
        return response;
    }
}

- (NSDictionary*)replaceNullObjectForDictionary:(NSDictionary*)dic{
    NSMutableDictionary *oDic = dic.mutableCopy;
    [oDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[NSNull class]]) {
            oDic[key] = @"";
        }else if ([obj isKindOfClass:[NSDictionary class]]) {
            oDic[key] = [self replaceNullObjectForDictionary:obj];
        }else if([obj isKindOfClass:[NSArray class]]){
            oDic[key] = [self replaceNullObjectForArray:obj];
        }
    }];
    return oDic.copy;
}

- (NSArray*)replaceNullObjectForArray:(NSArray*)arr{
    NSMutableArray *mArr = arr.mutableCopy;
    [mArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[NSDictionary class]]) {
            mArr[idx] = [self replaceNullObjectForDictionary:obj];
        }else if([obj isKindOfClass:[NSArray class]]){
            mArr[idx] = [self replaceNullObjectForArray:obj];
        }
    }];
    return mArr.copy;
}

@end
