//
//  FRCDataSource.m
//  FlickrBook
//
//  Created by Blagdon Jeffrey on 2/12/14.
//  Copyright (c) 2014 Jeffrey Blagdon. All rights reserved.
//

#import "FRCDataSource.h"
#import <CoreData/CoreData.h>

@interface FRCDataSource () <UITableViewDataSource, UITableViewDelegate>
@property NSFetchedResultsController *fetchedResultsController;

@end

@implementation FRCDataSource

-(id)initWithTableView:(UITableView *)tableView{
    self = [super init];
    if (self) {
        self.tableView = tableView;
        self.tableView.dataSource = self;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"MainCell"];
    return cell;
}

- (void) setContext:(NSManagedObjectContext *) context {
    _context = context;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Institution"];
    request.predicate = nil;
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name"
                                                              ascending:YES
                                                               selector:@selector(localizedStandardCompare:)]];
    self.fetchedResultsController = [[NSFetchedResultsController alloc]initWithFetchRequest:request managedObjectContext:context sectionNameKeyPath:nil cacheName:nil];
    
}


@end
