//
//  Event+CoreDataProperties.h
//  onLineDB
//
//  Created by Jean-Sébastien PICON on 05/11/2015.
//  Copyright © 2015 Jean-Sébastien PICON. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Event.h"

NS_ASSUME_NONNULL_BEGIN

@interface Event (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *timeStamp;

@end

NS_ASSUME_NONNULL_END
