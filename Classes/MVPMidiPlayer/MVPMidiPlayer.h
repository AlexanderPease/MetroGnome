//
//  MVPMidiPlayer.h
//
//  Original code by Ben Smiley-Andrews on 15/03/2012.
//  http://www.deluge.co/?q=midi-driven-animation-core-audio-objective-c
//
//  MetroGnome implementation and wrapper by Alexander Pease on 01/09/2012
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

/* Init MVPMidiPlayer with a midi file located at midiFileURL */
-(id)initWithMidiFileURL:(NSURL *)midiFileURL;

-(void)play;

/* Returns true if instance is currently playing */
-(bool)isPlaying; 

/* Stops the player, returns timestamp of current position */
-(MusicTimeStamp)pause; 

/* Sets time position of sequence held by self.player */
-(void)setTime:(MusicTimeStamp)timeStamp;

/* Stops the player, sets timestamp to beginning of sequence */
-(void)stop; 

/* Returns sequence being held by self.player 
 Sequence is a defined in AudioToolbox, it is what is played by MusicPlayer */
-(MusicSequence)getSequence;

/* Sets function for midi call back */ 
-(void)setMidiCallback; //Incomplete


/* Class methods */
+(void)test;

@end

