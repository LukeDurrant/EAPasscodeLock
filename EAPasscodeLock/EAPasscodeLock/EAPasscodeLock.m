//
//  EAPasscodeLock.m
//  EAPasscodeLock
//
//  Created by Ezequiel Leonardo Aceto on 6/22/12.
//  Copyright (c) 2012 Xenat. All rights reserved.
//

#import "EAPasscodeLock.h"
#import "EAPasscodeLockViewController.h"
#import "EAPasscodeLockProtocol.h"

@implementation EAPasscodeLock


-(UIViewController*) passcodeViewControllerWithCode:(NSString*)code delegate:(id<EAPasscodeLockProtocol>) _passcodeDelegate
{
    return [self passcodeViewControllerWithCode:code cancellable:YES hintText:@"" maxRetries:0 delegate:_passcodeDelegate];
}

-(UIViewController*) passcodeViewControllerWithCode:(NSString*)code cancellable:(BOOL)cancellable delegate:(id<EAPasscodeLockProtocol>) _passcodeDelegate
{
    return [self passcodeViewControllerWithCode:code cancellable:cancellable hintText:@"" maxRetries:0 delegate:_passcodeDelegate];    
}

-(UIViewController*) passcodeViewControllerWithCode:(NSString*)code cancellable:(BOOL)cancellable hintText:(NSString*)hintText  maxRetries:(int)retries delegate:(id<EAPasscodeLockProtocol>) _passcodeDelegate
{
    UIStoryboard*  sb = [UIStoryboard storyboardWithName:@"MainStoryboard"
                                                  bundle:nil];
    
    EAPasscodeLockViewController* passcodeViewController = [sb instantiateViewControllerWithIdentifier:@"EAPasscodeLockViewController"];
    
    [passcodeViewController setUnlockCode:code];
    [passcodeViewController setPasscodeDelegate:_passcodeDelegate];
    [passcodeViewController setMaxRetries:retries];
    [passcodeViewController setCancellable:cancellable];
    [passcodeViewController setHintText:hintText];

    return passcodeViewController;
}
@end
