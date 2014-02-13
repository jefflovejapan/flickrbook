//
//  MainViewController.m
//  FlickrBook
//
//  Created by Blagdon Jeffrey on 2/12/14.
//  Copyright (c) 2014 Jeffrey Blagdon. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property(strong, nonatomic)FRCDataSource *frcDataSource;
@end

@implementation MainViewController

- (id)init{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    MainViewController *_mvc = [sb instantiateViewControllerWithIdentifier:@"MainViewController"];
    return _mvc;
}

- (IBAction)pingFlickr:(id)sender {
    
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
