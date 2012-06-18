//
//  XMLView.m
//  MusicXMLView
//
//  Created by Alexander Pease on 2/24/12.
//  Copyright (c) 2012 Princeton University. All rights reserved.
//

#import "XMLView.h"

@interface XMLView (Private)
-(NSArray *)notes;
@end

@implementation XMLView

//Called to test the class
-(void)test {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"g" ofType:@"xml"];  
    [self loadWithFile:filePath];
    NSLog(file);
    NSLog(@"measureCount: %i",[self measureCount]);
    NSLog(@"noteCount: %i",[self noteCount]);
    NSLog(@"restCount: %i",[self restCount]);
    
    [self getMeasures];
    
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blueColor];
    }
    return self;
}

-(void)loadWithFile:(NSString *)filePath {
    file = [[NSString alloc] initWithContentsOfFile:filePath    
                                           encoding:NSUTF8StringEncoding       
                                              error:NULL];    
}

#pragma mark -
#pragma mark Getter methods

-(NSArray *)getMeasures {
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"<measure.*?<\/measure>"
                                                                           options:NSRegularExpressionDotMatchesLineSeparators
                                                                             error:&error];
    NSArray *measures = [regex matchesInString:file
                                  options:0
                                    range:NSMakeRange(0,[file length])];
    return measures;
}

#pragma mark -
#pragma mark Counting methods

/** Returns number <measure> objects in file. **/
-(NSInteger)measureCount {
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"<measure.*?<\/measure>"
                                                                           options:NSRegularExpressionDotMatchesLineSeparators
                                                                             error:&error];
    NSInteger count = [regex numberOfMatchesInString:file
                                             options:0 
                                               range:NSMakeRange(0, [file length])];    
    return count;
}

/** Returns number of <note> objects in file. Includes rests. **/
-(NSInteger)noteCount {
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"<note.*?<\/note>"
                                                                           options:NSRegularExpressionDotMatchesLineSeparators
                                                                             error:&error];
    NSInteger count = [regex numberOfMatchesInString:file
                                             options:0 
                                               range:NSMakeRange(0, [file length])];
    return count;
}

/** Returns number of <rest> objects in file. **/
-(NSInteger)restCount {
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"<rest \/>" 
                                                                           options:0 
                                                                             error:&error];
    NSInteger count = [regex numberOfMatchesInString:file 
                                             options:0 
                                               range:NSMakeRange(0, [file length])];
    return count;
}

#pragma mark -
#pragma mark Deprecated
//DEPRECATED
//Returns array of all note strings
-(NSArray *)notes {
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"<note"
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    NSRegularExpression *regexEnd = [NSRegularExpression regularExpressionWithPattern:@"</note>"
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    /*NSArray *array = [regex matchesInString:file 
                                    options:0 
                                      range:NSMakeRange(0, [file length])];*/
    
    
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:1];
    //Find the beginning of the expression, i.e. <note
    [regex enumerateMatchesInString:file
                            options:0 
                              range:NSMakeRange(0, [file length]) 
                         usingBlock:^(NSTextCheckingResult *resultStart, NSMatchingFlags flags, BOOL *stop)
    {
        NSLog(@"%d, %d", resultStart.range.location, resultStart.range.length);
        /* Find the first instance of the end of the expression, 
        i.e. <\note> */
        NSTextCheckingResult *resultEnd = [regex firstMatchInString:file 
         options:0 
         range:NSMakeRange(0, [file length])];
        
        
        NSLog(@"%d, %d", resultEnd.range.location, resultEnd.range.length);
        /* Add intervening string (a result) to return array */
        NSString *string = [file substringWithRange:
                            NSMakeRange(resultStart.range.location, 
                                        resultEnd.range.location+resultEnd.range.length)];
    }];
    return array;
}



@end
