//
//  KKNullObjectReplace.h
//  NullProject
//
//  Created by Kun on 25/03/2017.
//  Copyright © 2017 Kun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KKNullObjectReplace : NSObject


- (id)replaceNullObject:(id)response;

- (NSDictionary*)replaceNullObjectForDictionary:(NSDictionary*)dic;
- (NSArray*)replaceNullObjectForArray:(NSArray*)arr;
@end
