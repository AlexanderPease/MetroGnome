//
//  MVPMidiPlayer.h
//  FirstGame
//
//  Created by Ben Smiley-Andrews on 15/03/2012.
//  http://www.deluge.co/?q=midi-driven-animation-core-audio-objective-c
//  Copyright 2012 Deluge. All rights reserved.
//

#import <AudioToolbox/MusicPlayer.h>


@interface MVPMidiPlayer : NSObject {
    MusicPlayer _player;
}
@property(readwrite) AUGraph   processingGraph;
@property(readwrite) AudioUnit samplerUnit;
@property(readwrite) AudioUnit ioUnit;
@property(nonatomic,assign) MusicPlayer player;

+(id)MVPMidiPlayer;

-(void)dealloc;
-(id)init;

-(id)initWithMidiFile:(NSURL *)midiFileURL;
-(void)play;
-(bool)isPlaying; //Returns true if instance is currently playing
-(void)pause;//return timestamp?
-(void)stop; 
-(MusicSequence)getSequence; // Returns sequence being held by self.player

-(void)test;
-(void)originalCode; //the original method

@end

//Extra comments from original code

//#include <CoreMidi/MIDIServices.h>
//#include <CoreMidi/MIDISetup.h>
//#include <CoreMidi/MIDIThruConnection.h>
//#include <CoreMidi/MIDIDriver.h>
//#import  <CoreMIDI/CoreMIDI.h>

//#import <UIKit/UIKit.h>
//#include <AudioToolbox/AudioToolbox.h> //for AUGraph


//#import <AVFoundation/AVFoundation.h>
//#import <CoreAudio/CoreAudioTypes.h>

//#include <CoreFoundation/CoreFoundation.h>