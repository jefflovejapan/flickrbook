//
//  MainViewController.m
//  FlickrBook
//
//  Created by Blagdon Jeffrey on 2/12/14.
//  Copyright (c) 2014 Jeffrey Blagdon. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)init{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    MainViewController *_mvc = [sb instantiateViewControllerWithIdentifier:@"MainViewController"];
    return _mvc;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
