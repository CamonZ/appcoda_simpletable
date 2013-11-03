//
//  RecipeDetailViewController.h
//  SimpleTable
//
//  Created by CamonZ on 11/3/13.
//  Copyright (c) 2013 CamonZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeDetailViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *recipeLabel;
@property (nonatomic, strong) NSString *recipeName;

@end
