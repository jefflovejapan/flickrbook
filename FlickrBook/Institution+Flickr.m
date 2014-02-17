//
//  Institution+Flickr.m
//  FlickrBook
//
//  Created by Blagdon Jeffrey on 2/16/14.
//  Copyright (c) 2014 Jeffrey Blagdon. All rights reserved.
//

#import "Institution+Flickr.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@implementation Institution (Flickr)
+(void)loadInstitutionsFromFlickrArray:(NSArray *)instArray{
    
    AppDelegate *delegate = [[UIApplication sharedApplication]delegate];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Institution"];
    NSArray *serverUniques = [instArray valueForKey:@"nsid"];
    request.predicate = [NSPredicate predicateWithFormat:@"unique in %@", serverUniques];
    NSManagedObjectContext *context = delegate.store.managedObjectContext;
    NSError *error;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    NSSet *uniqueSet = [matches valueForKey:@"unique"];
    for (NSString *unique in serverUniques) {
        if (![uniqueSet containsObject:unique]) {
            self createInstitution
        }
    }
    
}

@end
