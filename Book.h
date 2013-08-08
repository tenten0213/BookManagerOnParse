//
//  Book.h
//  ParseStarterProject
//
//  Created by Takehito Amanuma on 2013/08/07.
//
//

#import <Foundation/Foundation.h>

@interface Book : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSDate *purchased;

@end

extern const NSString *kBookStatusNormal;
extern const NSString *kBookStatusOnLoan;
extern const NSString *kBookStatusWish;