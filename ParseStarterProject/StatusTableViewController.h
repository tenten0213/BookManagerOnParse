//
//  StatusTableViewController.h
//  ParseStarterProject
//
//  Created by Takehito Amanuma on 2013/08/07.
//
//

#import <UIKit/UIKit.h>
#import "Book.h"
#import "RegisterViewController.h"

@interface StatusTableViewController : UITableViewController
{
    NSArray *statusArray;
    
}

@property (nonatomic, strong) Book *book;
@property (nonatomic, strong) RegisterViewController *registerViewController;

@end
