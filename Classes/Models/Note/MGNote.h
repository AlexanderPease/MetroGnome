//
//  MGNote.h
//  MetroGnomeiPad
//
//  Created by Zander on 9/28/11.
//  Copyright 2011 MetroGnome, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "bassmidi.h"
#import "MidiFile.h"
#import "MGTimeSignature.h" //For NoteDuration definition


@interface MGNote : NSObject {
    NSInteger   _pitchClass;
    NSInteger   _octave; //!!!Combine these two into NSObject MGPitch Class
    NSInteger   _duration; /** in pulses (I think) */
    NSInteger   _startTime;
    NSInteger   _measureNumber; /** The measure number in the score */
    NSInteger   _position; /** The x position in the measure */
    UIImageView *_image;   /** Appropriate image for note value */
    CGPoint     *_imageCenter;
    
    
    int     deltaTime;     /** The time between the previous event and this on */
    int     startTime;     /** The absolute time this event occurs */
    bool    hasEventflag;  /** False if this is using the previous eventflag */
    u_char  eventFlag;     /** NoteOn, NoteOff, etc.  Full list is in class MidiFile */
    //Needs a channel 
    

    
    NSInteger   _velocity; /** The volume of the note */   
    
    
    
    u_char  instrument;    /** The instrument */
    
    u_char  keyPressure;   /** The key pressure */
    u_char  chanPressure;  /** The channel pressure */
    u_char  controlNum;    /** The controller number */
    u_char  controlValue;  /** The controller value */
    u_short pitchBend;     /** The pitch bend value */
    u_char  numerator;     /** The numerator, for MGTimeSignature meta events */
    u_char  denominator;   /** The denominator, for MGTimeSignature meta events */
    int     tempo;         /** The tempo, for Tempo meta events */
    u_char  metaevent;     /** The metaevent, used if eventflag is MetaEvent */
    int     metalength;    /** The metaevent length  */
    u_char* metavalue;     /** The raw byte value, for Sysex and meta events */
}
@property(nonatomic,assign) NSInteger   octave;
@property(nonatomic,assign) NSInteger   pitchClass;
@property(nonatomic,assign) NSInteger   duration;
@property(nonatomic,assign) NSInteger   startTime;
@property(nonatomic,assign) NSInteger   velocity;
@property(nonatomic,assign) NSInteger   measureNumber;
@property(nonatomic,assign) NSInteger   position;
@property(nonatomic,retain) UIImageView *image;
@property(nonatomic,assign) CGPoint     imageCenter;

/*
-(id)initWithPitchClass:(NSInteger)pitchClass
                 octave:(NSInteger)octave
               duration:(NSInteger)duration;
*/


-(id)initWithMidiEvent:(MidiEvent *)midiEvent; //Create MGNote from MidiEvent
-(id)initWithPitchClass:(NSInteger)pitchClass;

-(void)initImageWithValue:(NoteDuration)value; //Inits appropriate image

-(void)displayAtPosition:(CGPoint)position;


//Play an individual note (not a chord). Handles on/off
//-(void)play:(HSTREAM)stream;

//Sends on and off MIDI messages to BASS
-(void)noteOn:(HSTREAM)stream; 
-(void)noteOff:(HSTREAM)stream; 

-(MGNote *)ascendingInterval:(NSInteger)interval;
-(NSInteger)MIDIValue;

@end
