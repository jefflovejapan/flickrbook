//
//  Institution+Flickr.h
//  FlickrBook
//
//  Created by Blagdon Jeffrey on 2/16/14.
//  Copyright (c) 2014 Jeffrey Blagdon. All rights reserved.
//

#import "Institution.h"

@interface Institution (Flickr)

+(void)loadInstitutionsFromFlickrArray:(NSArray *)instArray;

@end
