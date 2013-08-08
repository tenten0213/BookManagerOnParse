//
//  RegisterViewController.m
//  ParseStarterProject
//
//  Created by Takehito Amanuma on 2013/08/06.
//
//

#import "RegisterViewController.h"
#import "StatusTableViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Custom initialization
        book = [[Book alloc] init];
        book.status = (NSString*)kBookStatusWish;
        book.purchased= [NSDate date];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.inputTitle.text = book.title;
    self.inputDescription.text = book.description;
    self.inputAuthor.text = book.author;
    [self.inputStatus setTitle:book.status forState:UIControlStateNormal];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd"];
    NSString *formatPurchased = [formatter stringFromDate:book.purchased];
    [self.inputPurchased setTitle:formatPurchased forState:UIControlStateNormal];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"prepareForSegue: %@", segue.identifier);
    
    
    if ([segue.identifier isEqualToString:@"Status"]) {
        StatusTableViewController *statusTableViewController = segue.destinationViewController;
        statusTableViewController.book = book;
        statusTableViewController.registerViewController = self;
    }
    else if ([segue.identifier isEqualToString:@"Purchased"]) {
        //segue.destinationViewController setHappiness:0];
    }
    
}


-(void)refreshStatus
{
    [self.inputStatus setTitle:book.status forState:UIControlStateNormal];
}


- (void)dealloc {
    [_inputTitle release];
    [_inputDescription release];
    [_inputAuthor release];
    [_inputStatus release];
    [_inputPurchased release];
    [super dealloc];
}
@end
