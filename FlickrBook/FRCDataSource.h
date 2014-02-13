//
//  FRCDataSource.h
//  FlickrBook
//
//  Created by Blagdon Jeffrey on 2/12/14.
//  Copyright (c) 2014 Jeffrey Blagdon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FRCDataSource : NSObject<UITableViewDataSource>
@property(strong, nonatomic)UITableView *tableView;
-(id)initWithTableView:(UITableView *)tableView;

@end
