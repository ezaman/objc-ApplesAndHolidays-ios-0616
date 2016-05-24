//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
} //////////

- (NSArray*) pickApplesFromFruits: (NSArray*)fruits {
    NSMutableArray *mPickApplesFromFruits = [[NSMutableArray alloc]init];
    
    NSPredicate *pickApples = [NSPredicate predicateWithFormat: @"self == %@", @"apple"];
    NSArray *Apples = [fruits filteredArrayUsingPredicate:pickApples];
    
    for (NSDictionary *character in Apples) {
        [mPickApplesFromFruits addObject: character];
    }
    return mPickApplesFromFruits;
    NSLog(@" %@",mPickApplesFromFruits);
}

/////////////

- (NSArray*) holidaysInSeason: (NSString*) season
                   inDatabase: (NSDictionary*) database{
    
    NSMutableArray *mHolidayInSeason = database[season];
    return mHolidayInSeason;
}

/////////////


- (NSArray*) suppliesInHoliday: (NSString*) holiday
                      inSeason: (NSString*) season
                    inDatabase: (NSDictionary*) database {
    
    NSMutableArray *mSupplies = database[season][holiday];
    return mSupplies;
}

////////////

- (BOOL) holiday: (NSString*) holiday
      isInSeason: (NSString*) season
      inDatabase: (NSDictionary*)database {
    
    BOOL returnHoliday = NO;
    if ([database[season] objectForKey: holiday]){
        returnHoliday = YES;
    }
    
    
    return returnHoliday;
}



////////////


- (BOOL) supply: (NSString*)supply
    isInHoliday: (NSString*)holiday
       inSeason: (NSString*) season
     inDatabase: (NSDictionary*) database{
    
    BOOL returnSupply = NO;
    if ([database[season][holiday] containsObject: supply]){
        returnSupply = YES;
    }
    
    return returnSupply;
    
    
}


////////////

- (NSDictionary*) addHoliday: (NSString*)holiday
                   toSeason: (NSString*) season
                  inDatabase: (NSDictionary*) database {
    
    NSMutableArray *value = [[NSMutableArray alloc] init];
    
    [database[season] setObject: value forKey:holiday];
    
    return database;
}


////////////

- (NSDictionary*) addSupply: (NSString*) supply
                  toHoliday: (NSString*) holiday
                   inSeason: (NSString*) season
                 inDatabase: (NSDictionary*) database {
    
    [database[season][holiday] addObject: supply];
    
    return database;
}




@end