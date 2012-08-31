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

-(void)dealloc;
-(id)init;

-(id)initWithMidiFile:(NSURL *)midiFileURL;
-(void)play;
-(bool)isPlaying; //Returns true if instance is currently playing
-(void)pause;//return timestamp? redudant with stop
-(void)stop; 
-(MusicSequence)getSequence; // Returns sequence being held by self.player
-(void)setMidiCallback;

+(void)test;
+(id)MVPMidiPlayer;

@end

