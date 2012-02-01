//
//  MGSingleStaffView.h
//  MetroGnomeiPad
//
//  Created by Alexander Pease on 1/22/12.
//  Copyright (c) 2012 Princeton University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGTimeSignature.h"

/** A single measure of a single staff MGScore */
@interface MGSingleStaffView : UIImageView {
    MGTimeSignature *_timeSignature; //Only used if first measure in a line
    NSMutableArray *_noteArray;
    NSInteger totalPositions; //
}
@property(nonatomic,retain) MGTimeSignature *timeSignature;
@property(nonatomic,retain) NSMutableArray *noteArray;
@property(nonatomic,assign) NSInteger totalPositions;

-(id)init; /** Does not take in a frame. For initing instance without knowing layout */
-(id)initWithFrame:(CGRect)frame;

-(void)displayTimeSignature; 

-(void)displayRegular; //Displays normal musical notation

/** Return CGPoint for position of given pitch value in this 
 SingleStaffView */
-(CGPoint)getPosition:(int)position forPitch:(int)pitch;

@end
