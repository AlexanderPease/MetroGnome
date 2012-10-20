//
//  MGMidiReader.m
//  MetroGnomeiPad
//
//  Created by Alexander Pease on 9/3/12.
//  Copyright (c) 2012 Princeton University. All rights reserved.
//

#import "MGMidiReader.h"
#import "MidiFile.h"

@implementation MGMidiReader
/* Appends MidiFile2 to the end of MidiFile1. Returns the path
 to the midi file. */
+(NSString *)appendMidiFilePath2:(NSString *)midiFilePath2 
              toMidiFilePath1:(NSString *)midiFilePath1 {
    
    MidiFile *midiFile1 = [[MidiFile alloc] initWithFile:midiFilePath1];
    MidiFile *midiFile2 = [[MidiFile alloc] initWithFile:midiFilePath2];

    Array *array = [midiFile1 events];
    for (int i = 0; i < [array count]; i++){
        NSLog(@"%@", [array get:i]);
    }
    
    
    return nil;
}


+(void)test {
    /* Modified the original code from main() in MidiFile.h */
    //NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString *name = [[NSString alloc]initWithFormat:@"simpletest"];
    NSString *midiFilePath = [[NSBundle mainBundle]
                              pathForResource:name
                              ofType:@"mid"];
    MidiFile *f = [[MidiFile alloc] initWithFile:midiFilePath];
    NSString *output = [f description];
    const char *out = [output cStringUsingEncoding:NSASCIIStringEncoding];
    printf("%s\n", out); 
    
    /* Test changing the MidiFile */
    
    
    /* Test writing a new midifile and playing it using MVPMidiPlayer */
    NSString *temporaryPath = [f writeTemporaryMidi];
    NSLog(@"temporaryPath: %@",temporaryPath);
    MVPMidiPlayer *player2 = [[MVPMidiPlayer alloc]initWithMidiFileURL:[NSURL fileURLWithPath:temporaryPath]];
    [player2 play];
    
    
}
@end
