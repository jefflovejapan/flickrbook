//
//  InstitutionsTVDS.m
//  FlickrBook
//
//  Created by Blagdon Jeffrey on 2/16/14.
//  Copyright (c) 2014 Jeffrey Blagdon. All rights reserved.
//

#import "InstitutionsTVDS.h"
#import "Institution+Flickr.h"
#import "Store.h"
#import "FlickrJSResponseSerializer.h"
#import <AFURLRequestSerialization.h>
#import <AFHTTPSessionManager.h>


@interface InstitutionsTVDS () <UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate>

@end

@implementation InstitutionsTVDS

-(id)initWithTableView:(UITableView *)tableView{
    self = [super init];
    if (self) {
        self.tableView = tableView;
        self.tableView.dataSource = self;
    }
    [self flickrFetch];
    return self;
}

-(void)flickrFetch{
    FlickrJSResponseSerializer *respSrlzr = [FlickrJSResponseSerializer serializer];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.responseSerializer = respSrlzr;

    NSString *UrlString = @"http://api.flickr.com/services/rest/";
    NSDictionary *params = @{@"method": @"flickr.commons.getInstitutions", @"api_key": [Store flickrApiKey], @"format": @"json"};
    [manager GET:UrlString parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *responseDict = responseObject;
        NSArray *instArray = [[NSArray alloc]initWithArray:responseDict[@"institutions"][@"institution"]];
        [Institution loadInstitutionsFromFlickrArray:instArray intoManagedObjectContext:[Store managedObjectContext]];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Derp, failure");
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"fetchedObjects: %d", [self.fetchedResultsController.fetchedObjects count]);
    return [self.fetchedResultsController.fetchedObjects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"MainCell"];
    Institution *inst = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = inst.name;
    return cell;
}

-(NSFetchedResultsController *)fetchedResultsController{
    if (!_fetchedResultsController) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Institution"];
        request.predicate = nil;
        request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name"
                                                                  ascending:YES
                                                                   selector:@selector(localizedStandardCompare:)]];
        _fetchedResultsController = [[NSFetchedResultsController alloc]
                                                                 initWithFetchRequest:request
                                                                 managedObjectContext:[Store managedObjectContext]
                                                                 sectionNameKeyPath:nil
                                                                 cacheName:nil];
        NSError *error;
        [_fetchedResultsController performFetch:&error];
    }
    return _fetchedResultsController;
}


#pragma NSFetchedResultsControllerDelegate

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath{
    if (type == NSFetchedResultsChangeUpdate) {
        [self.tableView reloadRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    } else {
//        TODO -- finger grain control
        [self.tableView reloadData];
    }
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller{
    [self.tableView beginUpdates];
}


@end
