//
//  MGFileManager.h
//  MetroGnomeiPad
//
//  Created by Alexander Pease on 10/18/12.
//  Copyright (c) 2012 Princeton University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MGFileManager : NSObject

/* Removes all temporary midi files (stored in the Documents directory)
 Permanent midi files are/should be saved in ____ directory */
+(void)removeTemporaryFiles;

+(void)test;

@end
