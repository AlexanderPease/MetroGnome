//
//  MGLesson_SimonSays.m
//  MetroGnomeiPad
//
//  Created by Alexander Pease on 8/31/12.
//  Copyright (c) 2012 Princeton University. All rights reserved.
//

#import "MGLesson_SimonSays.h"
#define LESSON_LENGTH 1

@implementation MGLesson_SimonSays
@synthesize lessonBlocks = _lessonBlocks;


/* !! I should really be stitching together multiple midi files first, then playing */
-(id)initLesson1 {
    if (self = [super init]) {
        // Init all lesson blocks 
        /* Future possibilities: randomize, change midi pitches before loading
         files, variable length, etc. */
        MGLessonBlock_MVP *block1 = [[MGLessonBlock_MVP alloc]
                                     initWithMidiName:@"44QuarterNote"];
        MGLessonBlock_MVP *block2 = [[MGLessonBlock_MVP alloc]
                                     initWithMidiName:@"simpletest"];
        
        
        self.lessonBlocks = [[NSArray alloc] initWithObjects:block1, block1, block1, nil];
        
        //Put all into a single midi file
    }
    return self;
}

-(void)play {
    MVPMidiPlayer *player = [MVPMidiPlayer alloc];
    for (int i = 0; i < [self.lessonBlocks count]; i++) {
        MGLessonBlock_MVP *lessonBlock = [self.lessonBlocks objectAtIndex:i];
        [player initWithMidiFile:lessonBlock.midiFileURL];
        [player play];
        
        MusicTimeStamp len;
        while (1) { // kill time until the music is over
            usleep (2 * 1000 * 1000); // suspend thread execution, measured in microseconds
            MusicTimeStamp now = 0;
            MusicPlayerGetTime (player.player, &now);
            if (now >= len)
                break;
        }
    }
    
}

@end
