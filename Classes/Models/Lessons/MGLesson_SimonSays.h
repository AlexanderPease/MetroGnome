//
//  MGLesson_SimonSays.h
//  MetroGnomeiPad
//
//  Created by Alexander Pease on 8/31/12.
//  Copyright (c) 2012 Princeton University. All rights reserved.
//

#import <Foundation/Foundation.h>

/** A linear lesson consisting of MGLessonBlock_MVPs. **/
@interface MGLesson_SimonSays : NSObject {
    NSArray *_lessonBlocks;
    MVPMidiPlayer *midiPlayer;
}
@property(nonatomic, retain) NSArray *lessonBlocks;

//-(void)dealloc;
//-(id)init;

-(void)play;

-(id)initLesson1;

+(void)test;

@end
