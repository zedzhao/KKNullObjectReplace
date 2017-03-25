//
//  main.m
//  NullProject
//
//  Created by Kun on 24/03/2017.
//  Copyright © 2017 Kun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "KKNullObjectReplace.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        //NSMutableDictionary *mDic = @{}.mutableCopy;
        NSMutableArray *arr = @[@"a", @"b", @"c", @"d", @"f"].mutableCopy;
        
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
           arr[idx] = @"1";
        }];
        NSDictionary *aDic = @{@"a":@"<null>",@"b":[NSNull null], };
        NSArray *aArr = @[@"a", aDic];
        NSDictionary *bDic = @{@"a": aArr, @"b" : aDic, @"c" : [NSNull null]};
        NSArray *bArr = @[@"a", @{@"d" : bDic}];
        KKNullObjectReplace *parse = KKNullObjectReplace.new;
        id a = [parse replaceNullObject:aArr];
        id b = [parse replaceNullObject:bDic];
        NSLog(@"%@",a );
        NSLog(@"%@", b );
        NSLog(@"%@", [parse replaceNullObject:bArr]);

    }
    return 0;
}
