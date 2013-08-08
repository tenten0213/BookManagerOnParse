//
//  RegisterViewController.m
//  ParseStarterProject
//
//  Created by Takehito Amanuma on 2013/08/06.
//
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Custom initialization
        book = [[Book alloc] init];
//        book.title = @"";
//        book.description = @"";
//        book.author= @"";
        book.status = (NSString*)kBookStatusNormal;
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


- (void)dealloc {
    [_inputTitle release];
    [_inputDescription release];
    [_inputAuthor release];
    [_inputStatus release];
    [_inputPurchased release];
    [super dealloc];
}
@end
