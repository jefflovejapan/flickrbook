//
//  MainViewController.h
//  FlickrBook
//
//  Created by Blagdon Jeffrey on 2/12/14.
//  Copyright (c) 2014 Jeffrey Blagdon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *pingFlickrItem;
@property(strong, nonatomic)NSString *flickrApiKey;
@end
