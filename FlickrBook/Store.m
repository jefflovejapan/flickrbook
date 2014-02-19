//
//  Store.m
//  FlickrBook
//
//  Created by Blagdon Jeffrey on 2/12/14.
//  Copyright (c) 2014 Jeffrey Blagdon. All rights reserved.
//

#import "Store.h"
@interface Store()
@end


@implementation Store

+(NSManagedObjectContext *)managedObjectContext{
    static id _managedObjectContext = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray *paths = [[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
        NSURL *documentsURL = [paths objectAtIndex:0];
        UIManagedDocument *doc = [[UIManagedDocument alloc]initWithFileURL:[documentsURL URLByAppendingPathComponent:@"FlickrDatabase"]];
        _managedObjectContext = [doc managedObjectContext];
    });
    return _managedObjectContext;
}

+(NSString *)flickrApiKey{
    return @"575470904abb319eef55c42ba6e0d644";
}

@end
