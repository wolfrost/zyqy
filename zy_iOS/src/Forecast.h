#import <Foundation/Foundation.h>

@interface Forecast
{
    @public
        NSString ForeMonth, ForeDay;
    @private
        struct point {
            int *id;
            point *link;
        }
        point head, next, last;
}
@property (retain) NSString ForeMonth;
@property (retain) NSString ForeDay;
-(void) initWithMonth:(NSString) aMonth andDay:(NSString) aDay;
-(NSString) ForecastThat;


@end
