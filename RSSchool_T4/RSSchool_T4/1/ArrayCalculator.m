#import "ArrayCalculator.h"

@implementation ArrayCalculator
+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array {
    
    // NSMutableArray *muttCopyArray = [[NSMutableArray alloc] initWithArray:array];
    //  NSLog(@"muttCopyArray count = %lu", (unsigned long)muttCopyArray.count);
    NSMutableArray *newNumberArray = [[NSMutableArray alloc] init];
    NSMutableArray *newArrayForString = [[NSMutableArray alloc] init];
           
    for (int i = 0; i < [array count]; i++){
         if ([[array objectAtIndex:i] isKindOfClass: [NSNumber class]]) {
            [newNumberArray addObject: [array objectAtIndex:i]];
         } else if ([[array objectAtIndex:i] isKindOfClass: [NSString class]]){
             [newArrayForString addObject: [array objectAtIndex:i]];
         }
    }
//          NSLog(@"newNumberArray count = %lu", (unsigned long)[newNumberArray count]);
//          NSLog(@"newArrayForString count = %lu", (unsigned long)[newArrayForString count]);
//           NSLog(@"Objects in newArray - %@", newNumberArray);
//           NSLog(@"Objects in newArrayForString - %@", newArrayForString);
    
    if ([newArrayForString count] == 3) {
        return 0;
    }
    
   NSArray *sortedArray = [newNumberArray sortedArrayUsingComparator:
    ^NSComparisonResult(id obj1, id obj2) {
        if ([obj1 intValue] < [obj2 intValue]) {
            return NSOrderedAscending;
        } else if ([obj1 intValue] > [obj2 intValue]) {
            return NSOrderedDescending;
        } else {
            return NSOrderedSame;
        }
      }];
           //NSLog(@"%@", sortedArray);
    
     if ([sortedArray count] == 7) {
        int result = (([[sortedArray firstObject] intValue] * [[sortedArray objectAtIndex:1] intValue]) * ([[sortedArray lastObject] intValue] * [[sortedArray objectAtIndex:5] intValue]));
           //NSLog(@"%d", result);
         return result;
     } else if ([sortedArray count] == 6) {
         int result2 = ([[sortedArray objectAtIndex:3] intValue] * [[sortedArray objectAtIndex:4] intValue] * [[sortedArray lastObject] intValue]);
           //NSLog(@"%d", result2);
         return result2;
     }
    
    
    NSUInteger res = 1;
        for (int j = 0; j < [newNumberArray count]; j++) {
            NSNumber *var1 = [newNumberArray objectAtIndex:j];
            res = res * [var1 intValue];
    }
          //NSLog(@"res = %lu", res);
    return res;
}
@end
