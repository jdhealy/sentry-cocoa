//
//  SentryUser.m
//  Sentry
//
//  Created by Daniel Griesser on 05/05/2017.
//  Copyright © 2017 Sentry. All rights reserved.
//

#import "SentryUser.h"
#import "NSDictionary+SentrySanitize.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SentryUser

- (instancetype)initWithUserId:(NSString *)userId {
    self = [super init];
    if (self) {
        self.userId = userId;
    }
    return self;
}

- (instancetype)init {
    return [super init];
}

- (NSDictionary<NSString *, id> *)serialize {
    NSMutableDictionary *serializedData = [[NSMutableDictionary alloc] init];
    
    [serializedData setValue:self.userId forKey:@"id"];
    [serializedData setValue:self.email forKey:@"email"];
    [serializedData setValue:self.username forKey:@"username"];
    [serializedData setValue:[self.extra sentry_sanitize] forKey:@"extra"];
    
    return serializedData;
}


@end

NS_ASSUME_NONNULL_END
