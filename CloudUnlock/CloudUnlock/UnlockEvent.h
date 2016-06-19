//
//  UnlockEvent.h
//  CloudUnlock
//
//  Created by Mulkey, Rodrigo S. on 6/19/16.
//  Copyright © 2016 Mulkey, Rodrigo S. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface UnlockEvent : NSManagedObject

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSDate *eventDate;
@property (nonatomic, strong) NSString *status;

@end


//@class FailedBankDetails;




