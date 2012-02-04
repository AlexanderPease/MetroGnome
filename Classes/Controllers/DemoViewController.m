//
//  DemoViewController.m
//  MetroGnomeiPad
//
//  Created by Alexander Pease on 2/4/12.
//  Copyright (c) 2012 Princeton University. All rights reserved.
//

#import "DemoViewController.h"
#import "bass.h"
#import "bassmidi.h"
#import "MGInstrument.h"
#import "MGSheetMusicView.h"


@implementation MGDemoViewController

-(void)go {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Z Kairos Blues" ofType:@"mid"];  
    HSTREAM stream=BASS_MIDI_StreamCreateFile(FALSE, [filePath UTF8String], 0, 0, 0, 44100);
    if (BASS_ErrorGetCode()) {
        NSLog(@"Bass error: %i", BASS_ErrorGetCode());
    }
    
    MGInstrument *testInstrument = [[MGInstrument alloc]initWithSoundFont:nil instrumentType:nil];
    
    BASS_MIDI_FONT streamFont[1];
    streamFont[0] = [testInstrument.soundFont getBASSMIDIFONT];
    [testInstrument release];
    
    BASS_MIDI_StreamSetFonts(stream, streamFont, 1); // apply it to the stream
    
    //Views
    CGSize screenSize = [UIScreen mainScreen].currentMode.size;
    self.view = [[UIView alloc]initWithFrame:CGRectMake(0,0,screenSize.height,screenSize.width)];
    MGSheetMusicView *sheet = [[MGSheetMusicView alloc]initWithFrame:CGRectMake(0,0,screenSize.height,screenSize.width)];
    [self.view addSubview:sheet];
    
    UIImageView *logo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"TrebleClefLogoBold.png"]];
    CGFloat heightOffset = 200.0;
    logo.center = CGPointMake(sheet.frame.size.width/2,sheet.frame.size.height/2 - heightOffset);
    [sheet addSubview:logo];
    
    CGSize textSize = CGSizeMake(850.0, 200.0);
    UITextView *intro = [[UITextView alloc]initWithFrame:CGRectMake(0,0, 
                                                                    textSize.width, textSize.height)]; 
    intro.center = CGPointMake(sheet.frame.size.width/2, sheet.frame.size.height/2);
    intro.text = [NSString stringWithFormat:@"Welcome to the 2012 Kairos Global Summit!\n"
                  "We have designed a short musical lesson for you to try.\n\n"
                  "Please touch the screen to continue."];
    intro.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0]; //Clear background
    [intro setFont:[UIFont fontWithName:@"Arial" size:32.0]];
    [sheet addSubview:intro];
    
    
    
    //PLay midi file
    BASS_ChannelPlay(stream, FALSE);
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    if ((orientation == UIInterfaceOrientationLandscapeRight) ||
        (orientation == UIInterfaceOrientationLandscapeLeft))
        return YES;
    
    return NO;
}

@end
