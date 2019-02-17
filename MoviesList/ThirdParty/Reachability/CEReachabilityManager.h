
#import <Foundation/Foundation.h>
#import <Reachability/Reachability.h>
#define isInternetAvailable [CEReachabilityManager isReachable]
#define NetworkManager [CEReachabilityManager sharedManager]
@class Reachability;
@interface CEReachabilityManager : NSObject

@property (strong, nonatomic) Reachability *reachability;

#pragma mark -
#pragma mark Shared Manager
+ (CEReachabilityManager *)sharedManager;

#pragma mark -
#pragma mark Class Methods
+ (BOOL)isReachable;

@end
