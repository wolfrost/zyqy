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
    
}

@property (nonatomic,retain) IBOutlet UIButton *showResult;
@property (nonatomic,retain)IBOutlet UITextField *lunarMonth;
@property (nonatomic,retain)IBOutlet UITextField *lunarDay;
-(IBAction)showResultClicked:(id)sender;
@end
