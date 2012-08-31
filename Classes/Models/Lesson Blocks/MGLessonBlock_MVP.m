//
//  MGLessonBlock_MVP.m
//  MetroGnomeiPad
//
//  Created by Alexander Pease on 8/31/12.
//  Copyright (c) 2012 Princeton University. All rights reserved.
//

#import "MGLessonBlock_MVP.h"

@implementation MGLessonBlock_MVP
@synthesize midiFileURL = _midiFileURL;
@synthesize xmlFileURL  = _xmlFileURL;

-(void)dealloc {
    self.midiFileURL = nil;
    [super dealloc];
}

/* Inits the lesson block with just a MIDI file */
-(id)initWithMidiName:(NSString *)name {
    if (self = [super init]) {
        NSString *midiFilePath = [[NSBundle mainBundle]
                                  pathForResource:name
                                  ofType:@"mid"];
        self.midiFileURL = [NSURL fileURLWithPath:midiFilePath];
	}
	return self;
}
@end
