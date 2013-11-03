//
//  SimpleTableViewController.m
//  SimpleTable
//
//  Created by CamonZ on 11/1/13.
//  Copyright (c) 2013 CamonZ. All rights reserved.
//

#import "SimpleTableViewController.h"
#import "SimpleTableCell.h"
#import "RecipeDetailViewController.h"

@interface SimpleTableViewController ()

@end

@implementation SimpleTableViewController{
  NSMutableArray *tableData;
  NSMutableArray *thumbnails;
  NSMutableArray *prepTimes;
}

@synthesize tableView;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return [tableData count];
}

  static NSString *simpleTableIdentifier = @"SimpleTableCell";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
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

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
  [tableData removeObjectAtIndex:indexPath.row];
  [thumbnails removeObjectAtIndex:indexPath.row];
  [prepTimes removeObjectAtIndex:indexPath.row];
  [tableView reloadData];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
  if([segue.identifier isEqualToString:@"showRecipeDetail"]){
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    RecipeDetailViewController *destViewController = segue.destinationViewController;
    destViewController.recipeName = [tableData objectAtIndex:indexPath.row];
  }
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
