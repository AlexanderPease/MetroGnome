//
//  MGLessonBlock.h
//  MetroGnomeiPad
//
//  Created by Alexander Pease on 8/31/12.
//  Copyright (c) 2012 Princeton University. All rights reserved.
//

#import <Foundation/Foundation.h>

/** A simple lesson block that holds pointers to a MIDI file and an XML file.
 There is no interplay between the two; the block plays the midi file and 
 displays the xml file */
@interface MGLessonBlock : NSObject {
    NSString *_midiFilePath;
    NSString *_xmlFilePath;
    
}
@property(nonatomic,retain) NSString *midiFilePath;
@property(nonatomic,retain) NSString *xmlFilePath;

/* Inits the lesson block with just a MIDI file */
-(id)initWithMidiName:(NSString *)name;


/* Takes array of MGLessonBlocks and concatenates into a single MGLessonBlock */
+(MGLessonBlock *)combineLessonBlocks:(NSArray *)array;


// I need to eventually add XML functionality

@end
