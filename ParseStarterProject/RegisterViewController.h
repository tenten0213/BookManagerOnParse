//
//  RegisterViewController.h
//  ParseStarterProject
//
//  Created by Takehito Amanuma on 2013/08/06.
//
//

#import <UIKit/UIKit.h>
#import "Book.h"

@interface RegisterViewController : UIViewController
{
    Book *book;
}
@property (retain, nonatomic) IBOutlet UITextField *inputTitle;
@property (retain, nonatomic) IBOutlet UITextField *inputDescription;
@property (retain, nonatomic) IBOutlet UITextField *inputAuthor;
@property (retain, nonatomic) IBOutlet UIButton *inputStatus;
@property (retain, nonatomic) IBOutlet UIButton *inputPurchased;

@end
