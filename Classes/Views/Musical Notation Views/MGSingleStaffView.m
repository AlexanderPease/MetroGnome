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
-(CGFloat)getPositionForPitch:(int)position
                    andOctave:(int)octave; //The pitch (y) position
@end

@implementation MGSingleStaffView
@synthesize timeSignature = _timeSignature;
@synthesize noteArray = _noteArray;
@synthesize totalPositions = _totalPositions;
@synthesize clef = _clef;

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
    if (self.timeSignature == NULL) {
        NSLog(@"MGSingleStaffView: no time signature to display");
        return;
    }
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
-(CGPoint)getPosition:(int)position 
             forPitch:(int)pitch 
            andOctave:(int)octave {
    CGFloat xPosition = [self getPosition:position];
    CGFloat yPosition = [self getPositionForPitch:pitch 
                                        andOctave:octave];
    return CGPointMake(xPosition, yPosition);
}


/************************************************************************/

/** Returns CGFloat of x axis for position */
-(CGFloat)getPosition:(int)position {
    CGFloat totalWidth = self.frame.size.width;
    CGFloat nudge = 40;
    if (self.totalPositions == 0 || self.totalPositions < 0) {
        self.totalPositions = [self.noteArray count];
        if (self.totalPositions == 0) {
            return position * 100 + nudge; //Worst case
        }
    }
    CGFloat positionWidth = totalWidth / self.totalPositions;
    return positionWidth * position + nudge;
}

/**!!!!!!!Needs to support bass/ clef !!!!*/
/**!!!!!!!Harcode common values !!!!*/
/**!!!!!!!Add in extra staff lines if off the page */
/**Take in sharps/flats, ie. support both F and Esharp */


/** Returns CGFloat of y axis for pitch position on staff */
-(CGFloat)getPositionForPitch:(int)pitch andOctave:(int)octave {
    CGRect rect = [self frame];
    CGFloat height = rect.size.height;
    CGFloat dist = height / 9;
    CGFloat nudge = height / 20;
    //Positions are based on G4-F5 +/- octaves
    //else if (position == PITCH_CLASS_Fsharp) {return dist*0+nudge;}
    if (pitch == PITCH_CLASS_G) {
        CGFloat pitchPosition = dist*6+nudge;
        return pitchPosition - (octave-4)*(dist*8);
    }
    //else if (position == PITCH_CLASS_Gsharp) {return dist*6+nudge;}
    else if (pitch == PITCH_CLASS_A) {
        CGFloat pitchPosition = dist*5+nudge;
        return pitchPosition - (octave-4)*(dist*8);
    }
    //else if (position == PITCH_CLASS_Asharp) {return dist*5+nudge;}
    else if (pitch == PITCH_CLASS_B) {
        CGFloat pitchPosition = dist*4+nudge;
        return pitchPosition - (octave-4)*(dist*8);
    }
    else if (pitch == PITCH_CLASS_C) {
        CGFloat pitchPosition = dist*3+nudge;
        return pitchPosition - (octave-5)*(dist*8);
    }
    //else if (position == PITCH_CLASS_Csharp) {return dist*3+nudge;}
    else if (pitch == PITCH_CLASS_D) {
        CGFloat pitchPosition = dist*2+nudge;
        return pitchPosition - (octave-5)*(dist*8);
    }
    //else if (position == PITCH_CLASS_Dsharp) {return dist*2+nudge;}
    else if (pitch == PITCH_CLASS_E) {
        CGFloat pitchPosition = dist*1+nudge;
        return pitchPosition - (octave-5)*(dist*8);
    }
    else if (pitch == PITCH_CLASS_F) {
        CGFloat pitchPosition = dist*0+nudge;
        return pitchPosition - (octave-5)*(dist*8);
    }
    else {NSLog(@"MGSingleStaffView:error"); return 0;}
}


@end
