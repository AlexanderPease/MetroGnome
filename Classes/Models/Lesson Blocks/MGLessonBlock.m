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
    int numFiles = [array count];
    NSMutableArray *filePathArray = [[NSMutableArray alloc]initWithCapacity:numFiles];

    
    /* Create array of midiFilePaths */
    for (int i = 0; i<numFiles; i++) {
        MGLessonBlock *block = [array objectAtIndex:i];
        [filePathArray insertObject:block.midiFilePath atIndex:i];
    }
    
    /* Generate concatenated MidiFile and return MidiBlock with 
       path to temporary .mid file */
    MidiFile *midiFile = [[MidiFile alloc]initWithArrayOfFiles:filePathArray];
    NSString *newMidiFile
    
    //OLD
    /* Extract all event arrays and concatenate */
    /*for (int i = 0; i < [array count]; i++) {
        MGLessonBlock *lessonBlock = [array objectAtIndex:i];
        MidiFile *midiFile = [[MidiFile alloc] initWithFile:lessonBlock.midiFilePath];
        Array *eventsArray = [midiFile events];
        for (int j = 0; j < [eventsArray count]; j++) {
            
        }
        MidiEvent *event = [eventArray get:1];
    }
     */
    
    return [array objectAtIndex:1];
    
}

@end
