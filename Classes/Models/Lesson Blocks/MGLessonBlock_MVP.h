//
//  MGLessonBlock_MVP.h
//  MetroGnomeiPad
//
//  Created by Alexander Pease on 8/31/12.
//  Copyright (c) 2012 Princeton University. All rights reserved.
//

#import <Foundation/Foundation.h>

/** A simple lesson block that holds pointers to a MIDI file and an XML file.
 There is no interplay between the two; the block plays the midi file and 
 displays the xml file */
@interface MGLessonBlock_MVP : NSObject {
    NSURL *_midiFileURL;
    NSURL *_xmlFileURL;
    
}
@property(nonatomic,retain) NSURL *midiFileURL;
@property(nonatomic,retain) NSURL *xmlFileURL;

/* Inits the lesson block with just a MIDI file */
-(id)initWithMidiName:(NSString *)name;

@end
