//
//  MGLesson_SimonSays.m
//  MetroGnomeiPad
//
//  Created by Alexander Pease on 8/31/12.
//  Copyright (c) 2012 Princeton University. All rights reserved.
//

#import "MGLesson_SimonSays.h"
#define LESSON_LENGTH 2

@implementation MGLesson_SimonSays
@synthesize lessonBlock = _lessonBlock;


/* !! I should really be stitching together multiple midi files (MGLessonBlocks) first, then playing */
-(id)initLesson1 {
    if (self = [super init]) {
        //self.lessonBlock = [MGLessonBlock alloc];
        
        /* Create array of blocks */
        
        /* Concatenate together*/
        MGLessonBlock *block1 = [[MGLessonBlock alloc]
                                     initWithMidiName:@"44QuarterNote"];
        MGLessonBlock *block2 = [[MGLessonBlock alloc]
                                     initWithMidiName:@"simpletest"];
        NSArray *array = [[NSArray alloc]initWithObjects:block1, block2, nil];
        
        //self.lessonBlock = [MGLessonBlock combineLessonBlocks:array]; 
        
        self.lessonBlock = block1;
        /* Future possibilities: randomize, change midi pitches before loading
         files, variable length, etc. */
    }
    return self;
}



-(void)play {
    MVPMidiPlayer *player = [MVPMidiPlayer alloc];
    [player initWithMidiFileURL:[NSURL fileURLWithPath:self.lessonBlock.midiFilePath]];
    [player play];
    
    
    /* Old code: NEED TO CHANGE PARADIGM: PLAY A SINGLE FILE
    /*MVPMidiPlayer *player = [MVPMidiPlayer alloc];
    for (int i = 0; i < [self.lessonBlocks count]; i++) {
        MGLessonBlock *lessonBlock = [self.lessonBlocks objectAtIndex:i];
        [player initWithMidiFileURL:lessonBlock.midiFileURL];
        [player play];
        
        MusicTimeStamp len;
        while (1) { // kill time until the music is over
            usleep (2 * 1000 * 1000); // suspend thread execution, measured in microseconds
            MusicTimeStamp now = 0;
            MusicPlayerGetTime (player.player, &now);
            if (now >= len)
                break;
        }
    }*/
}

/* Test the class */
+(void)test {
    MGLesson_SimonSays *lesson1 = [[MGLesson_SimonSays alloc]initLesson1];
    [lesson1 play];
}

@end
