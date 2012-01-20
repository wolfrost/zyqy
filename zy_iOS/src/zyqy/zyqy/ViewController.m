//
//  ViewController.m
//  zyqy
//
//  Created by Kevin Chu on 12-1-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "Forecast.h"
@implementation ViewController


@synthesize showResult,lunarDay,lunarMonth;
@synthesize gregorianDay,gregorianYear,gregorianMonth,gregorianToLunar,scrollView;
-(IBAction)bgTouched:(id)sender
{
    [lunarMonth resignFirstResponder];
    [lunarDay resignFirstResponder];
    [gregorianDay resignFirstResponder];
    [gregorianMonth resignFirstResponder];
    [gregorianYear resignFirstResponder];

}
-(IBAction)doneEditing:(id)sender
{
    [sender resignFirstResponder];
}
-(IBAction)gregorianToLunarClicked:(id)sender
{
    NSInteger intYear, intMonth, intDay;
    NSString *result;
    intYear = [[gregorianYear text] integerValue];
    intMonth = [[gregorianMonth text] integerValue];
    intDay = [[gregorianDay text] integerValue];
    [self bgTouched:sender];
    if ((intDay<=30&&intDay>=1)&&(intMonth<=12)&&(intMonth>=1)&&(intYear<=2100&&intYear>=1921))
    {
      
        NSDateComponents *components = [[NSDateComponents alloc] init];
        [components setDay:intDay];
        [components setMonth:intMonth];
        [components setYear:intYear];
        NSCalendar *gregorian =[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDate *date = [gregorian dateFromComponents:components];
        Forecast *forecast = [[Forecast alloc] init]; 
        result = [forecast LunarForSolar:date];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"公历转换为农历" 
                                                 message:result 
                                                 delegate:self 
                                                 cancelButtonTitle:@"OK" 
                                                 otherButtonTitles:nil];
        [alert show];
        [alert  release];        
        NSLog(@"%@",result);
        [forecast release];        

    }
    CGRect scrollViewRect = [scrollView frame];
    [scrollView scrollRectToVisible:scrollViewRect animated:YES];
}

-(IBAction)showResultClicked:(id)sender
{
    
    int intMonth, intDay;
    NSString *result;
    intMonth = [[lunarMonth text] intValue];
    intDay = [[lunarDay text] intValue];
    [self bgTouched:sender];
    if ((intMonth<=12&&intMonth>=1)&&(intDay<=30&&intDay>=1)) {
        NSLog(@"%i月，%i日",intMonth,intDay);    
        Forecast *forcast = [[Forecast alloc] initWithMonth:intMonth andDay:intDay];
        result = [forcast ForecastThat];
        NSLog(@"您的有缘人在您出生地的%@",result);
        UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"你的配偶在你出生地的"
                                                 message:result 
                                                 delegate:self 
                                                 cancelButtonTitle:@"OK" 
                                                 otherButtonTitles:nil];
        [alert show];
        [alert release];
        [forcast release];
    }

}
-(void) textFieldDidBeginEditing:(UITextField *) textFieldView{
    currentTextField = textFieldView;
}
-(BOOL) textFieldShouldReturn:(UITextField *) textFieldView {
    [textFieldView resignFirstResponder];
    return NO;
}
-(void) textFieldDidEndEditing:(UITextField *) textFieldView {
    currentTextField = nil;
}
-(void) keyboardDidShow:(NSNotification *) notification {
    if (keyboardIsShown) {
        return;
    }
    NSDictionary *info = [notification userInfo];
    NSValue *aValue = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [self.view convertRect:[aValue CGRectValue] fromView:nil];
    NSLog(@"keyborad height:%f",keyboardRect.size.height);
    CGRect viewFrame = [scrollView frame];
    viewFrame.size.height -= keyboardRect.size.height;
    scrollView.frame = viewFrame;
    
    
    if ((currentTextField != lunarDay)&&(currentTextField != lunarMonth)) {
        CGRect textFieldRect = [gregorianDay frame];
        [scrollView scrollRectToVisible:textFieldRect animated:YES];
    }
    keyboardIsShown = YES;

}
-(void) keyboardDidHide:(NSNotification *) notification {
    NSDictionary *info = [notification userInfo];
    NSValue *aValue = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [ self.view convertRect:[aValue CGRectValue] fromView:nil];
    
    CGRect viewFrame = [scrollView frame];
    viewFrame.size.height += keyboardRect.size.height;
    scrollView.frame = viewFrame;
    
    keyboardIsShown = NO;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    scrollView.scrollEnabled = NO;
    scrollView.frame = CGRectMake(0, 0, 320, 460);
    [scrollView setContentSize:CGSizeMake(320, 680)];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{

    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    //注册键盘通知
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:self.view.window];
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:UIKeyboardWillShowNotification
     object:nil];
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:UIKeyboardWillHideNotification
     object:nil];
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)dealloc {
    [lunarDay release];
    [lunarMonth release];
    [showResult release];
    [gregorianDay release];
    [gregorianYear release];
    [gregorianMonth release];
    [gregorianToLunar release];
    [scrollView release];
    [super dealloc];
}
@end
