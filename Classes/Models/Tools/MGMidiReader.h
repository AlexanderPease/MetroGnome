//
//  MGMidiReader.h
//  MetroGnomeiPad
//
//  Created by Alexander Pease on 9/3/12.
//  Copyright (c) 2012 Princeton University. All rights reserved.
//

#import <Foundation/Foundation.h>

/* Based around and uses MidiFile for underlying operations */
@interface MGMidiReader : NSObject

/* Appends MidiFile2 to the end of MidiFile1. Returns the temporary NSString path 
 to a temporary midi file. */
-(NSString *)appendMidiFilePath2:(NSString *)midiFilePath2 
              toMidiFilePath1:(NSURL *)midiFilePath1;





+(void)test;

@end
