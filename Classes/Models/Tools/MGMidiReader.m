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


+(void)test {
    
    /* Original code from main() in MidiFile.h */
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
    //[player2 play];
    
    
    /* Ensure temporary files can be deleted */
    // For error information
    NSError *error;
    
    // Create file manager
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    
    // Point to Document directory
    NSString *documentsDirectory = [NSHomeDirectory() 
                                    stringByAppendingPathComponent:@"Documents"];
    // Show contents of Documents directory
    NSLog(@"Documents directory: %@",
          [fileMgr contentsOfDirectoryAtPath:documentsDirectory error:&error]);
    
     [fileMgr ]
}
@end
