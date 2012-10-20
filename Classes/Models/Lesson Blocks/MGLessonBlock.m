//
//  MGLessonBlock_MVP.m
//  MetroGnomeiPad
//
//  Created by Alexander Pease on 8/31/12.
//  Copyright (c) 2012 Princeton University. All rights reserved.
//

#import "MGLessonBlock.h"
#import "MidiFile.h"

@implementation MGLessonBlock
@synthesize midiFilePath = _midiFilePath;
@synthesize xmlFilePath  = _xmlFilePath;

-(void)dealloc {
    self.midiFilePath = nil;
    [super dealloc];
}

/* Inits the lesson block with just a MIDI file */
-(id)initWithMidiName:(NSString *)name {
    if (self = [super init]) {
        self.midiFilePath = [[NSBundle mainBundle]
                                  pathForResource:name
                                  ofType:@"mid"];
	}
	return self;
}


/* Takes array of MGLessonBlocks and concatenates into a single MGLessonBlock */
+(MGLessonBlock *)combineLessonBlocks:(NSArray *)array {
    
    /* Extract all event arrays and concatenate */
    for (int i = 0; i < [array count]; i++) {
        MidiFile *midiFile = [[MidiFile alloc] initWithFile:[array objectAtIndex:i]];
        Array *eventArray = [midiFile events];
        
        
        
        //NSLog(@"%@", [array get:i]);
    }

    
    return [array objectAtIndex:1];
    
}

@end
