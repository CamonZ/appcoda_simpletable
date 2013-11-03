//
//  SimpleTableViewController.m
//  SimpleTable
//
//  Created by CamonZ on 11/1/13.
//  Copyright (c) 2013 CamonZ. All rights reserved.
//

#import "SimpleTableViewController.h"
#import "SimpleTableCell.h"

@interface SimpleTableViewController ()

@end

@implementation SimpleTableViewController{
  NSMutableArray *tableData;
  NSMutableArray *thumbnails;
  NSMutableArray *prepTimes;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  static NSString *simpleTableIdentifier = @"SimpleTableCell";
  SimpleTableCell *cell = (SimpleTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
  
  if(cell == nil){
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
    cell =[nib objectAtIndex:0];
  }
  

  cell.nameLabel.text = [tableData objectAtIndex:indexPath.row];
  cell.imageView.image = [UIImage imageNamed:[thumbnails objectAtIndex:indexPath.row]];
  cell.prepTimeLabel.text = [prepTimes objectAtIndex:indexPath.row];
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  UIAlertView *messageAlert = [[UIAlertView alloc]
                               initWithTitle:@"Row Selected" message:[tableData objectAtIndex:indexPath.row]
                                delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
  [messageAlert show];
  UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
  cell.accessoryType = UITableViewCellAccessoryCheckmark;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
  UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
  cell.accessoryType = UITableViewCellAccessoryNone;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
  [tableData removeObjectAtIndex:indexPath.row];
  [thumbnails removeObjectAtIndex:indexPath.row];
  [prepTimes removeObjectAtIndex:indexPath.row];
  [tableView reloadData];
}

- (void)viewDidLoad{
  [super viewDidLoad];
	// Initialize table data
  
  NSString *path = [[NSBundle mainBundle] pathForResource:@"recipes" ofType:@"plist"];
  
  NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
  
  tableData = [[NSMutableArray alloc] initWithArray:[dict objectForKey:@"RecipeName"]];
  thumbnails = [[NSMutableArray alloc] initWithArray:[dict objectForKey:@"Thumbnail"]];
  prepTimes = [[NSMutableArray alloc] initWithArray:[dict objectForKey:@"PrepTime"]];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 78;
}

@end
