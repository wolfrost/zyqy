#import "Forecast.h"

@implementation Forecast
@synthesize ForeMonth, ForeDay;
-(void) initWithMonth:(NSString) aMonth andDay:(NSString) aDay
{
    self = [super init];
    if ( self != nil )
    {
        [self setForeMonth];
        [self setForeDay];
    }
    return self;
}
@end
