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
  NSArray *tableData;
  NSArray *thumbnails;
  NSArray *prepTimes;
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

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
  UIAlertView *messageAlert = [[UIAlertView alloc]
                               initWithTitle:@"Row Selected" message:@"You've Selected a Row"
                                delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
  [messageAlert show];
}

- (void)viewDidLoad{
  [super viewDidLoad];
	// Initialize table data
  tableData = [NSArray arrayWithObjects:@"Egg Benedict",
    @"Mushroom Risotto", @"Full Breakfast", @"Hamburger",
    @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut",
    @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg",
    @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea",
    @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
  
  thumbnails = [NSArray arrayWithObjects:@"egg_benedict.jpg",
    @"mushroom_risotto.jpg", @"full_breakfast.jpg", @"hamburger.jpg",
    @"ham_and_egg_sandwich.jpg", @"creme_brelee.jpg",
    @"white_chocolate_donut.jpg", @"starbucks_coffee.jpg", @"vegetable_curry.jpg",
    @"instant_noodle_with_egg.jpg", @"noodle_with_bbq_pork.jpg", @"japanese_noodle_with_pork.jpg",
    @"green_tea.jpg", @"thai_shrimp_cake.jpg", @"angry_birds_cake.jpg", @"ham_and_cheese_panini.jpg", nil];

  prepTimes = [NSArray arrayWithObjects:@"30 mins",
    @"30 mins", @"20 mins", @"25 mins",
    @"5 mins", @"20 mins",
    @"10 mins", @"5 mins", @"15 mins",
    @"10 mins", @"30 mins", @"30 mins",
    @"2 mins", @"30 mins", @"30 mins", @"5 mins", nil];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 78;
}

@end
