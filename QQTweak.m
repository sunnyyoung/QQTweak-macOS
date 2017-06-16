#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import <objc/runtime.h>
#import <objc/message.h>

@implementation NSObject (QQTweak)

#pragma mark - Constructor

__attribute__((constructor)) static void revokeMessages(void) {
    Class class = objc_getClass("MQAIOChatViewController");
    SEL selector = NSSelectorFromString(@"revokeMessages:");
    Method method = class_getInstanceMethod(class, selector);
    IMP imp = imp_implementationWithBlock(^(id self, id arg1) {
        return ;
    });
    class_replaceMethod(class, selector, imp, method_getTypeEncoding(method));
}

__attribute__((constructor)) static void handleRecallNotify(void) {
    Class class = objc_getClass("QQMessageRevokeEngine");
    SEL selector = NSSelectorFromString(@"handleRecallNotify:isOnline:");
    Method method = class_getInstanceMethod(class, selector);
    IMP imp = imp_implementationWithBlock(^(id self, id arg1, BOOL isOnline) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSUserNotification *userNotification = [[NSUserNotification alloc] init];
            userNotification.informativeText = @"成功拦截一条撤回消息";
            [[NSUserNotificationCenter defaultUserNotificationCenter] deliverNotification:userNotification];
        });
    });
    class_replaceMethod(class, selector, imp, method_getTypeEncoding(method));
}

__attribute__((constructor)) static void QQReportEngine(void) {
    Class class = objc_getClass("QQReportEngine");
    SEL selector = NSSelectorFromString(@"init");
    Method method = class_getInstanceMethod(class, selector);
    IMP imp = imp_implementationWithBlock(^(id self, id arg1) {
        return nil;
    });
    class_replaceMethod(class, selector, imp, method_getTypeEncoding(method));
}

__attribute__((constructor)) static void QQLogReporter(void) {
    Class class = objc_getClass("QQLogReporter");
    SEL selector = NSSelectorFromString(@"init");
    Method method = class_getInstanceMethod(class, selector);
    IMP imp = imp_implementationWithBlock(^(id self, id arg1) {
        return nil;
    });
    class_replaceMethod(class, selector, imp, method_getTypeEncoding(method));
}

__attribute__((constructor)) static void ErrorLogReport(void) {
    Class class = objc_getClass("ErrorLogReport");
    SEL selector = NSSelectorFromString(@"init");
    Method method = class_getInstanceMethod(class, selector);
    IMP imp = imp_implementationWithBlock(^(id self, id arg1) {
        return nil;
    });
    class_replaceMethod(class, selector, imp, method_getTypeEncoding(method));
}

__attribute__((constructor)) static void LogReportEvent(void) {
    Class class = objc_getClass("LogReportEvent");
    SEL selector = NSSelectorFromString(@"init");
    Method method = class_getInstanceMethod(class, selector);
    IMP imp = imp_implementationWithBlock(^(id self, id arg1) {
        return nil;
    });
    class_replaceMethod(class, selector, imp, method_getTypeEncoding(method));
}

__attribute__((constructor)) static void KeyEventLogReport(void) {
    Class class = objc_getClass("KeyEventLogReport");
    SEL selector = NSSelectorFromString(@"init");
    Method method = class_getInstanceMethod(class, selector);
    IMP imp = imp_implementationWithBlock(^(id self, id arg1) {
        return nil;
    });
    class_replaceMethod(class, selector, imp, method_getTypeEncoding(method));
}

@end
