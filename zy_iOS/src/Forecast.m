#import "Forecast.h"
@implementation Forecast
@synthesize ForeMonth, ForeDay;
-(id) initWithMonth:(int) aMonth andDay:(int) aDay
{
    self = [super init];
    if ( self != nil )
    {
        [self setForeMonth:aMonth];
        [self setForeDay:aDay];
    }
    return self;
}

-(NSString *) ForecastThat
{
    typedef struct point{
        int id;
        struct point *link;
    }*pPoint, Point;
    int Fore_Month=ForeMonth,Fore_Day=ForeDay;
    pPoint head, next, last;
    int i;
    NSString *result;
    head = (pPoint)malloc(sizeof(Point));
    head->id = 1;
    last = head;
    for(i=2;i<=12;i++)
    {
        next = (pPoint)malloc(sizeof(Point));
        next->id = i;
        last->link = next;
        last = next;
    }
    last->link = head;
    next = head;
    for (i=1;i<Fore_Month;i++)
    {
        next = next->link;
    }
    for(i=1;i<Fore_Day;i++)
    {
        next = next->link;
    }
    switch(next->id)
    {
        case 1:
            result = @"东北方或西南方";
            break;
        case 2:
            result = @"东方或西方";
            break;
        case 3:
            result = @"东南方或西北方";
            break;
        case 4:
            result = @"东南方或西北方";
            break;
        case 5:
            result = @"南方或北方";
            break;
        case 6:
            result = @"西南方或东北方";
            break;
        case 7:
            result = @"西南方或东北方";
            break;
        case 8:
            result = @"西方或东方";
            break;
        case 9:
            result = @"西北方或东南方";
            break;
        case 10:
            result = @"西北方或东南方";
            break;
        case 11:
            result = @"北方或南方";
            break;
        case 12:
            result = @"东北方或西南方";
            
    }
    for(i=1;i<=12;i++)
    {
        last = head;
        head = head->link;
        free(last);
    }
    //NSLog(@"%@",result);
    return result;
}
@end
