//
//  ViewController.h
//  zyqy
//
//  Created by Kevin Chu on 12-1-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UITextField *lunarMonth;
    IBOutlet UITextField *lunarDay;
    IBOutlet UIButton *showResult;
    IBOutlet UITextField *gregorianYear;
    IBOutlet UITextField *gregorianMonth;
    IBOutlet UITextField *gregorianDay;
    IBOutlet UIButton *gregorianToLunar;
    BOOL keyboardIsShown;
    UITextField *currentTextField;
    
}

@property (nonatomic,retain)IBOutlet UIButton *showResult;
@property (nonatomic,retain)IBOutlet UITextField *lunarMonth;
@property (nonatomic,retain)IBOutlet UITextField *lunarDay;
@property (nonatomic,retain)IBOutlet UITextField *gregorianYear;
@property (nonatomic,retain)IBOutlet UITextField *gregorianMonth;
@property (nonatomic,retain)IBOutlet UITextField *gregorianDay;
@property (nonatomic,retain)IBOutlet UIScrollView *scrollView;
@property (nonatomic,retain)IBOutlet UIButton *gregorianToLunar;
-(IBAction)gregorianToLunarClicked:(id)sender;
-(IBAction)showResultClicked:(id)sender;
-(IBAction)doneEditing:(id)sender;
-(IBAction)bgTouched:(id)sender;
@end
