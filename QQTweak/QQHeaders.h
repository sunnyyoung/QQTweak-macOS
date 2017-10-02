//
//  QQHeaders.h
//  QQTweak
//
//  Created by Sunnyyoung on 2017/9/16.
//  Copyright © 2017年 Sunnyyoung. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>

typedef void (*CDUnknownFunctionPointerType)(void);

struct RecallModel {
    CDUnknownFunctionPointerType *_field1;
    int _field2;
    _Bool _field3;
    _Bool _field5;
    unsigned long long _field6;
    union {
        unsigned long long _field1;
        unsigned long long _field2;
    } _field7;
};

@interface MQAIOChatViewController : NSViewController

- (void)revokeMessages:(id)messages;

@end

@interface QQMessageRevokeEngine: NSObject

- (void)handleRecallNotify:(id)notify isOnline:(BOOL)isOnline;

@end
