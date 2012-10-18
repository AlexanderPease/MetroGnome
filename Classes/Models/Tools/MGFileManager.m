//
//  MGFileManager.m
//  MetroGnomeiPad
//
//  Created by Alexander Pease on 10/18/12.
//  Copyright (c) 2012 Princeton University. All rights reserved.
//

#import "MGFileManager.h"

@implementation MGFileManager

/* Removes all temporary midi files (stored in the Documents directory)
 Permanent midi files are/should be saved in ____ directory */
+(void)removeTemporaryFiles {
    // Create file manager
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    NSError *error;
    
    // Point to Documents directory
    NSString *documentsDirectory = [NSHomeDirectory() 
                                    stringByAppendingPathComponent:@"Documents"];
    // Show contents of Documents directory
    NSArray *directoryContents = [fileMgr contentsOfDirectoryAtPath:documentsDirectory 
                                                              error:&error];
    
    /* Delete all contents of Document directory.
    This directory is for temporary midis only */
    [fileMgr removeItemAtPath:documentsDirectory error:&error];
    
    // Error checking
    if (error) {
        directoryContents = [fileMgr contentsOfDirectoryAtPath:documentsDirectory 
                                                         error:&error];
        NSLog(@"MGFileManager: Documents directory contents not deleted: %@", directoryContents); 
    }
}

+(void)test {
    [MGFileManager removeTemporaryFiles];
}
@end
