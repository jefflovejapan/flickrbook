//
//  MainViewController.m
//  FlickrBook
//
//  Created by Blagdon Jeffrey on 2/12/14.
//  Copyright (c) 2014 Jeffrey Blagdon. All rights reserved.
//

#import "MainViewController.h"
#import "FlickrJSResponseSerializer.h"
#import <AFURLRequestSerialization.h>
#import <AFHTTPSessionManager.h>

@interface MainViewController () <NSURLSessionDataDelegate>
@property(strong, nonatomic)FRCDataSource *frcDataSource;
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
        NSLog(@"oh yeah, got this response: %@", responseObject);
        NSLog(@"responseObject is a %@", [responseObject class]);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Ouch, still got this error: %@", error);
    }];
}

-(void)writeDerpWithString:(NSString *)barf{
    NSLog(@"barf: %@", barf);
}


-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setToolbarHidden:NO animated:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.frcDataSource = [[FRCDataSource alloc]initWithTableView:self.tableView];
    self.flickrApiKey = @"575470904abb319eef55c42ba6e0d644";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
