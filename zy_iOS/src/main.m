#import "Forecast.h"

int main(int argc, char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    Forecast *forecast = [[Forecast alloc] initWithMonth:10 andDay:14];
    [forecast setForeMonth:10];
    [forecast setForeDay:14];
    NSLog(@"%i",[forecast ForeMonth]);
    NSLog(@"%i",[forecast ForeDay]);
    NSLog(@"你的有缘人在你的%@", [forecast ForecastThat]);
    //NSDate *sd = [[NSDate alloc] init];
    NSDate *sd = [NSDate dateWithNaturalLanguageString:@"1911/11/21"];
    NSLog(@"%@",[forecast LunarForSolar:sd]);
    [forecast release];
    [pool drain];
    return 0;
}
