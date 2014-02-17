//
//  Photo.h
//  FlickrBook
//
//  Created by Blagdon Jeffrey on 2/16/14.
//  Copyright (c) 2014 Jeffrey Blagdon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Institution;

@interface Photo : NSManagedObject

@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSData * thumbnailData;
@property (nonatomic, retain) NSString * uploadDate;
@property (nonatomic, retain) NSString * subtitle;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) Institution *owned_by;

@end
