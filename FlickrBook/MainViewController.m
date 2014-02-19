//
//  MainViewController.m
//  FlickrBook
//
//  Created by Blagdon Jeffrey on 2/12/14.
//  Copyright (c) 2014 Jeffrey Blagdon. All rights reserved.
//

#import "MainViewController.h"
#import "FlickrJSResponseSerializer.h"
#import "Institution+Flickr.h"
#import "InstitutionsTVDS.h"
#import "Store.h"
#import <AFURLRequestSerialization.h>
#import <AFHTTPSessionManager.h>

@interface MainViewController () <NSURLSessionDataDelegate>
@property(strong, nonatomic)InstitutionsTVDS *dataSource;
@end

@implementation MainViewController

- (id)init{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    MainViewController *_mvc = [sb instantiateViewControllerWithIdentifier:@"MainViewController"];
    return _mvc;
    sel_registerName("pingFlickr:");
}

- (IBAction)pingFlickr:(id)sender {
    FlickrJSResponseSerializer *respSrlzr = [FlickrJSResponseSerializer serializer];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.responseSerializer = respSrlzr;

    NSString *UrlString = @"http://api.flickr.com/services/rest/";
    NSDictionary *params = @{@"method": @"flickr.commons.getInstitutions", @"api_key": self.flickrApiKey, @"format": @"json"};
    [manager GET:UrlString parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *responseDict = responseObject;
        NSArray *instArray = [[NSArray alloc]initWithArray:responseDict[@"institutions"][@"institution"]];
        [Institution loadInstitutionsFromFlickrArray:instArray intoManagedObjectContext:[Store managedObjectContext]];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Derp, failure");
    }];
 }



-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setToolbarHidden:NO animated:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dataSource = [[InstitutionsTVDS alloc]initWithTableView:self.tableView];
    self.flickrApiKey = @"575470904abb319eef55c42ba6e0d644";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
