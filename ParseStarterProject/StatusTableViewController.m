//
//  StatusTableViewController.m
//  ParseStarterProject
//
//  Created by Takehito Amanuma on 2013/08/07.
//
//

#import "StatusTableViewController.h"

@interface StatusTableViewController ()

@end

@implementation StatusTableViewController

// - (id)initWithStyle:(UITableViewStyle)style
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Custom initialization
        // Create Data
        NSMutableDictionary *statusNormal = [[NSMutableDictionary alloc] initWithObjectsAndKeys:kBookStatusNormal,@"text", @NO,@"check",nil];
        NSMutableDictionary *statusOnLoan = [[NSMutableDictionary alloc] initWithObjectsAndKeys:kBookStatusOnLoan,@"text", @NO,@"check",nil];
        NSMutableDictionary *statusWish = [[NSMutableDictionary alloc] initWithObjectsAndKeys: kBookStatusWish,@"text",@NO,@"check",nil];
        
        statusArray = [[NSArray alloc] initWithObjects:statusNormal,statusOnLoan,statusWish, nil];
        
    }
    return self;
}
- (IBAction)cancelSelectStatus:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)doneSelectStatus:(id)sender {
    
    for (NSMutableDictionary *dictionary in statusArray) {
        NSString *text = [dictionary objectForKey:@"text"];
        NSNumber *check = [dictionary objectForKey:@"check"];
        
        if ([check boolValue]) {
            self.book.status = text;
            [self.registerViewController refreshStatus];
        }
    }

    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    for (NSMutableDictionary *dictionary in statusArray) {
        NSString *text = [dictionary objectForKey:@"text"];
        if ([self.book.status isEqualToString:text]) {
            [dictionary setObject:@YES forKey:@"check"];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"statusCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell.textLabel setText:[[statusArray objectAtIndex:[indexPath row]] objectForKey:@"text"]];
    
    if ([[[statusArray objectAtIndex:[indexPath row]] objectForKey:@"check"] boolValue]) {
        cell.accessoryType =  UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType =  UITableViewCellAccessoryNone;
    }
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // チェックされた行
    int row = [indexPath row];
    
    NSMutableArray *arrayWithAnimation = [[NSMutableArray alloc] init];
    NSMutableArray *arrayWithoutAnimation = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [statusArray count]; i++) {
        NSMutableDictionary *dictionary = [statusArray objectAtIndex:i];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        
        if (i == row) {
            [dictionary setObject:@YES forKey:@"check"];
            [arrayWithAnimation addObject:indexPath];
        } else {
            [dictionary setObject:@NO forKey:@"check"];
            [arrayWithoutAnimation addObject:indexPath];
        }
    }
    
    [tableView reloadRowsAtIndexPaths:arrayWithAnimation withRowAnimation:UITableViewRowAnimationFade];
    [tableView reloadRowsAtIndexPaths:arrayWithoutAnimation withRowAnimation:UITableViewRowAnimationNone];
    
}

@end
