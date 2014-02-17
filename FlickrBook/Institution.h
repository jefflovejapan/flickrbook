//
//  Institution.h
//  FlickrBook
//
//  Created by Blagdon Jeffrey on 2/16/14.
//  Copyright (c) 2014 Jeffrey Blagdon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Photo;

@interface Institution : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * flickrURL;
@property (nonatomic, retain) NSString * licenseURL;
@property (nonatomic, retain) NSString * siteURL;
@property (nonatomic, retain) NSString * unique;
@property (nonatomic, retain) NSSet *photos;
@end

@interface Institution (CoreDataGeneratedAccessors)

- (void)addPhotosObject:(Photo *)value;
- (void)removePhotosObject:(Photo *)value;
- (void)addPhotos:(NSSet *)values;
- (void)removePhotos:(NSSet *)values;

@end
