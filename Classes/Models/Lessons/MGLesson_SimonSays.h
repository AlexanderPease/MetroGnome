//
//  MGLesson_SimonSays.h
//  MetroGnomeiPad
//
//  Created by Alexander Pease on 8/31/12.
//  Copyright (c) 2012 Princeton University. All rights reserved.
//

#import <Foundation/Foundation.h>

/** A dynamic, linear lesson consisting of MGLessonBlocks. These blocks are loaded into
 the temporary lessonBlock such that their is only one midi file to play and
 a single xml file to display. Which MGLessonBlocks are loaded are a function
 of each lesson method. **/
@interface MGLesson_SimonSays : NSObject {
    MGLessonBlock *_lessonBlock; 
    MVPMidiPlayer *midiPlayer;
}
@property(nonatomic, retain) MGLessonBlock *lessonBlock;

//-(void)dealloc;
//-(id)init;

-(void)play;

-(id)initLesson1;

+(void)test;

@end
