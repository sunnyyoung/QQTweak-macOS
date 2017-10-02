//
//  QQTweak.m
//  QQTweak
//
//  Created by Sunnyyoung on 2017/9/16.
//  Copyright © 2017年 Sunnyyoung. All rights reserved.
//

#import "QQTweak.h"
#import "QQHeaders.h"
#import "fishhook.h"

// Global Function
static NSArray<NSString *> *(*original_NSSearchPathForDirectoriesInDomains)(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde);
NSArray<NSString *> *tweak_NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde) {
    if (domainMask == NSUserDomainMask) {
        NSMutableArray<NSString *> *directories = [original_NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde) mutableCopy];
        [directories enumerateObjectsUsingBlock:^(NSString * _Nonnull object, NSUInteger index, BOOL * _Nonnull stop) {
            switch (directory) {
                case NSDocumentDirectory: directories[index] = [NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Containers/com.tencent.qq/Data/Documents"]; break;
                case NSLibraryDirectory: directories[index] = [NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Containers/com.tencent.qq/Data/Library"]; break;
                case NSApplicationSupportDirectory: directories[index] = [NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Containers/com.tencent.qq/Data/Library/Application Support"]; break;
                case NSCachesDirectory: directories[index] = [NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Containers/com.tencent.qq/Data/Library/Caches"]; break;
                default: break;
            }
        }];
        return directories;
    } else {
        return original_NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
    }
}

@implementation NSObject (QQTweak)

#pragma mark - Constructor

static void __attribute__((constructor)) tweak(void) {
    // Global Function Hook
    rebind_symbols((struct rebinding[1]) {
        { "NSSearchPathForDirectoriesInDomains", tweak_NSSearchPathForDirectoriesInDomains, (void *)&original_NSSearchPathForDirectoriesInDomains }
    }, 1);
    // Method Swizzling
    [objc_getClass("MQAIOChatViewController") jr_swizzleMethod:NSSelectorFromString(@"revokeMessages:") withMethod:@selector(tweak_revokeMessages:) error:nil];
    [objc_getClass("QQMessageRevokeEngine") jr_swizzleMethod:NSSelectorFromString(@"handleRecallNotify:isOnline:") withMethod:@selector(tweak_handleRecallNotify:isOnline:) error:nil];
    [objc_getClass("NSRunningApplication") jr_swizzleClassMethod:NSSelectorFromString(@"runningApplicationsWithBundleIdentifier:") withClassMethod:@selector(tweak_runningApplicationsWithBundleIdentifier:) error:nil];
}

#pragma mark - Handle RevokeMessage

- (void)tweak_revokeMessages:(id)messages {
    // TODO
}

- (void)tweak_handleRecallNotify:(struct RecallModel*)notify isOnline:(BOOL)isOnline {
    // TODO
    dispatch_async(dispatch_get_main_queue(), ^{
        NSUserNotification *userNotification = [[NSUserNotification alloc] init];
        userNotification.informativeText = @"成功拦截一条撤回消息";
        [[NSUserNotificationCenter defaultUserNotificationCenter] deliverNotification:userNotification];
    });
}

+ (NSArray *)tweak_runningApplicationsWithBundleIdentifier:(NSString *)identifier {
    return [self tweak_runningApplicationsWithBundleIdentifier:[NSBundle mainBundle].bundleIdentifier];
}

@end
