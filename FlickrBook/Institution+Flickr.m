//
//  Institution+Flickr.m
//  FlickrBook
//
//  Created by Blagdon Jeffrey on 2/16/14.
//  Copyright (c) 2014 Jeffrey Blagdon. All rights reserved.
//

#import "Institution+Flickr.h"

@implementation Institution (Flickr)
+(void)loadInstitutionsFromFlickrArray:(NSArray *)instArray{
    for (NSDictionary *inst in instArray) {
        NSString *unique = inst[@"nsid"];
        NSLog(@"unique: %@", unique);
//        add institution to core data database
    }
}

@end
