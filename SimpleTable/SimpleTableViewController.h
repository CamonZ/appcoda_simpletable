//
//  SimpleTableViewController.h
//  SimpleTable
//
//  Created by CamonZ on 11/1/13.
//  Copyright (c) 2013 CamonZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@end
