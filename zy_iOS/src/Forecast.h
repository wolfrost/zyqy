#import <Foundation/Foundation.h>

@interface Forecast:NSObject
{
    int ForeMonth, ForeDay;
}
@property int ForeMonth,ForeDay;

-(id) initWithMonth:(int) aMonth andDay:(int) aDay;
-(NSString *) ForecastThat;


@end
