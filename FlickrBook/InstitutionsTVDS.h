//
//  InstitutionsTVDS.h
//  FlickrBook
//
//  Created by Blagdon Jeffrey on 2/16/14.
//  Copyright (c) 2014 Jeffrey Blagdon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface InstitutionsTVDS : NSObject <UITableViewDataSource>
@property(strong, nonatomic)UITableView *tableView;
@property(strong, nonatomic)NSFetchedResultsController *fetchedResultsController;
-(id)initWithTableView:(UITableView *)tableView;

@end
