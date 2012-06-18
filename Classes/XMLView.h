//
//  XMLView.h
//  MusicXMLView
//
//  Created by Alexander Pease on 2/24/12.
//  Copyright (c) 2012 Princeton University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMLView : UIView {
    NSString *file;
}

-(void)test;
-(void)loadWithFile:(NSString *)filePath;

-(NSArray *)getMeasures;

/** Returns number of <note> objects in file. Includes rests. **/
-(NSInteger)noteCount;

/** Returns number of <rest> objects in file. **/
-(NSInteger)restCount;

/** Returns number of <measure> objects in file. **/
-(NSInteger)measureCount;

@end
