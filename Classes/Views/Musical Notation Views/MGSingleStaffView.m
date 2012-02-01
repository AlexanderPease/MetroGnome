//
//  MGSingleStaffView.m
//  MetroGnomeiPad
//
//  Created by Alexander Pease on 1/22/12.
//  Copyright (c) 2012 Princeton University. All rights reserved.
//

#import "MGSingleStaffView.h"
#import "MGBarLineView.h"
#import "MGNote.h"

@interface MGSingleStaffView (Private)
-(CGFloat)getPosition:(int)position; //The x-axis position
-(CGFloat)getPitchPosition:(int)position; //The pitch (y) position
@end

@implementation MGSingleStaffView
@synthesize timeSignature = _timeSignature;
@synthesize noteArray = _noteArray;
@synthesize totalPositions = _totalPositions;

-(void)dealloc {
    [super dealloc];
}

/** Does not take in a frame. For initing instance without knowing layout */
-(id)init {
    if (self = [super init]) {
        UIImage *singleStaff = [UIImage imageNamed:@"SingleStaff.png"];
        self.image = singleStaff;
        self.noteArray = [[NSMutableArray alloc]init];
        
        //Create opening bar line
        //MGBarLineView *startingLine = [[MGBarLineView alloc]initAtPosition:CGPointMake(0.0, 0.0)];
        //[self addSubview:startingLine];
    }
    return self;
}

//Takes in frame size in which to display staff
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIImage *singleStaff = [UIImage imageNamed:@"SingleStaff.png"];
        self.image = singleStaff;
        self.noteArray = [[NSMutableArray alloc]init];
        
        //Create opening bar line
        //MGBarLineView *startingLine = [[MGBarLineView alloc]initAtPosition:CGPointMake(0.0, 0.0)];
        //[self addSubview:startingLine];
    }
    return self;
}


-(void)displayTimeSignature {
    [self.timeSignature initView];
    self.timeSignature.view.center = CGPointMake(0.0, self.center.y);
    [self addSubview:self.timeSignature.view];
}

//Display normal musical notation
-(void)displayRegular {
    for (int i = 0; i < [self.noteArray count]; i++) {
        MGNote *note = [self.noteArray objectAtIndex:i];
        //CGPoint position = [self pitchPosition:note.pitchClass];
        //[note displayAtPosition:CGPointMake(i*10,yPosition)];
        [self addSubview:note.image];        
    }
}

/** Return CGPoint for position of given pitch value in this 
 SingleStaffView */
-(CGPoint)getPosition:(int)position forPitch:(int)pitch {
    CGFloat xPosition = [self getPosition:position];
    CGFloat yPosition = [self getPitchPosition:pitch];
    return CGPointMake(xPosition, yPosition);
}


/************************************************************************/


-(CGFloat)getPosition:(int)position {
    CGFloat totalWidth = self.frame.size.width;
    return 0;
}

-(CGFloat)getPitchPosition:(int)position {
    CGRect rect = [self frame];
    CGFloat height = rect.size.height;
    CGFloat dist = height / 9;
    CGFloat nudge = height / 19;
    //Positions are from G4-F5
    if (position == PITCH_CLASS_A) {return dist*5+nudge;}
    //else if (position == PITCH_CLASS_Asharp) {return dist*5+nudge;}
    else if (position == PITCH_CLASS_B) {return dist*4+nudge;}
    else if (position == PITCH_CLASS_C) {return dist*3+nudge;}
    //else if (position == PITCH_CLASS_Csharp) {return dist*3+nudge;}
    else if (position == PITCH_CLASS_D) {return dist*2+nudge;}
    //else if (position == PITCH_CLASS_Dsharp) {return dist*2+nudge;}
    else if (position == PITCH_CLASS_E) {return dist*1+nudge;}
    else if (position == PITCH_CLASS_F) {return dist*0+nudge;}
    //else if (position == PITCH_CLASS_Fsharp) {return dist*0+nudge;}
    else if (position == PITCH_CLASS_G) {return dist*6+nudge;}
    //else if (position == PITCH_CLASS_Gsharp) {return dist*6+nudge;}
    else {NSLog(@"MGSingleStaffView:error"); return 0;}
}


@end
