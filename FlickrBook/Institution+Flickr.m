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

+(void)loadInstitutionsFromFlickrArray:(NSArray *)instArray
              intoManagedObjectContext:(NSManagedObjectContext *)context{
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Institution"];
    NSArray *serverUniques = [instArray valueForKey:@"nsid"];
    
//    Mapping between unique keys and dicts from server response
    NSDictionary *serverDict = [NSDictionary dictionaryWithObjects:instArray forKeys:serverUniques];

    request.predicate = [NSPredicate predicateWithFormat:@"unique in %@", serverUniques];
    NSError *error;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    

//  So now I've got everything that's in the db. What I want to do is find everything that's in serverUniques that *isn't* in the db and add it.
    
    for (NSString *unique in serverUniques) {
        NSArray *someArray = [matches filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"unique = %@", unique]];
        if (!someArray || [someArray count] == 0) {
            NSLog(@"completed institution: %@", [self institutionWithFlickrDict:serverDict[unique] inManagedObjectContext:context]);
        }
    }
    
    NSArray *newMatches = [context executeFetchRequest:request error:&error];
    NSLog(@"newMatches: %@", newMatches);
}

+(Institution *)institutionWithFlickrDict:(NSDictionary *)flickrDict
       inManagedObjectContext:(NSManagedObjectContext *)context{
    Institution *inst = nil;
    inst = [NSEntityDescription insertNewObjectForEntityForName:@"Institution"
                                         inManagedObjectContext:context];
    
    [inst setValue:flickrDict[@"name"][@"_content"] forKey:@"name"];
    NSLog(@"urls: %@", flickrDict[@"urls"][@"url"]);
    for (NSDictionary *url in flickrDict[@"urls"][@"url"]) {
        [self setValueOnInstitution:(Institution *)inst withURL:(NSDictionary *)url];
    }
    [inst setValue:flickrDict[@"nsid"] forKey:@"unique"];
    return inst;
}
    
+(void)setValueOnInstitution:(Institution *)inst withURL:(NSDictionary *)url{
    NSDictionary *ref = @{@"flickr": @"flickrURL", @"license": @"licenseURL", @"site": @"siteURL"};
    [inst setValue:url[@"_content"] forKey:ref[url[@"type"]]];
}

@end
