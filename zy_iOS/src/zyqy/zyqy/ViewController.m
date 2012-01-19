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

-(IBAction)showResultClicked:(id)sender
{
    
    int intMonth, intDay;
    intMonth = [[lunarMonth text] intValue];
    intDay = [[lunarDay text] intValue];
    if ((intMonth<=12&&intMonth>=1)&&(intDay<=30&&intDay>=1)) {
        NSLog(@"%i月，%i日",intMonth,intDay);    
        Forecast *forcast = [[Forecast alloc] initWithMonth:intMonth andDay:intDay];
    
        NSLog(@"您的有缘人在您出生地的%@",[forcast ForecastThat]);
        [forcast release];
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
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
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
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
    [super dealloc];
}
@end
