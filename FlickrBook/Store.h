//
//  Store.h
//  FlickrBook
//
//  Created by Blagdon Jeffrey on 2/12/14.
//  Copyright (c) 2014 Jeffrey Blagdon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Store : NSObject
+(NSManagedObjectContext *) managedObjectContext;
+(NSString *) flickrApiKey;
@end
