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

#define BUTTONWIDTH 150
#define BUTTONHEIGHT 45
#define LABELOFFSET 30

@interface MGDemoViewController (Private)
-(void)helpBackground;
-(void)playBackground;
-(void)lesson;
-(void)playLesson;
-(void)pauseLesson;
@end


@implementation MGDemoViewController
@synthesize sheet = _sheet;
@synthesize label = _label;
@synthesize logo = _logo;
@synthesize musicDisplay = _musicDisplay;
@synthesize button = _button;
@synthesize playPause = _playPause;
@synthesize progress = _progress;

-(void)nextScreen {
    if (self.progress == 0) {
        self.progress++;
        [self explain];
    }
    else if (self.progress == 1) {
        self.progress++;
        [self background];
    }
    else if (self.progress == 2) {
        self.progress++;
        [self lesson];
    }
}
-(void)go {
    //start over
    self.progress = 0;
    
    //View. self.sheet acts as button
    CGSize screenSize = [UIScreen mainScreen].currentMode.size;
    self.view = [[UIView alloc]initWithFrame:CGRectMake(0,0,screenSize.height,screenSize.width)];
    self.sheet = [[MGSheetMusicView alloc]initWithFrame:CGRectMake(0,0,screenSize.height,screenSize.width)];
    [self.view addSubview:self.sheet];
    
    self.logo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"TrebleClefLogoBold.png"]];
    CGFloat heightOffset = 240.0;
    self.logo.center = CGPointMake(self.sheet.frame.size.width/2,self.sheet.frame.size.height/2 - heightOffset);
    self.sheet.demo = self;
    [self.sheet addSubview:self.logo];
    
    CGSize textSize = CGSizeMake(850.0, 500.0);
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(0,0, 
                                                          textSize.width, textSize.height)]; 
    int offset = 30;
    self.label.center = CGPointMake(self.sheet.frame.size.width/2, self.sheet.frame.size.height/2-LABELOFFSET);
    self.label.numberOfLines = 4;
    self.label.text = [NSString stringWithFormat:@"Welcome to the 2012 Kairos Global Summit!\n"
                  "We have designed a short musical lesson for you to try.\n\n"
                  "Tap the screen to continue."];
    self.label.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0]; //Clear background
    [self.label setFont:[UIFont fontWithName:@"Arial" size:32.0]];
    [self.sheet addSubview:self.label];
    [self.label release];
}

-(void)explain {
    self.label.numberOfLines = 7;
    self.label.text = [NSString stringWithFormat:@"Lesson: Repeat After Me(troGnome)\n"
                       "Style: Blues\n\n"
                       "The piano will play a short phrase every other measure.\n"
                       "Your goal is to repeat each phrase in the next measure.\n"
                       "Try to stay in time with MetroGnome's accompaniment!\n\n"
                       ""];

    
}

-(void)background {
    self.label.center = CGPointMake(self.sheet.frame.size.width/2, self.sheet.frame.size.height/2-LABELOFFSET);
    self.label.text = [NSString stringWithFormat:@"Scale: Blues (Major)\n\n"
                       "Many scales are associated with the blues. "
                       "Below is a scale commonly used in the C Major Blues."
                       "This lesson only uses the first three notes: C, Eflat, and F. \n\n"
                       "If you need help finding these notes, tap the Help button."];

    
    [self.musicDisplay removeFromSuperview];
    self.musicDisplay = [[UIImageView alloc]initWithImage:
                         [UIImage imageNamed:@"C Major Blues Scale.tiff"]];
    CGFloat scale = 0.7;
    self.musicDisplay.frame = CGRectMake(0, 0, 
                                         self.musicDisplay.frame.size.width*scale, 
                                         self.musicDisplay.frame.size.height*scale);
    self.musicDisplay.center = CGPointMake(self.sheet.frame.size.width/2, 
                                           self.sheet.frame.size.height-self.musicDisplay.frame.size.height);
    [self.sheet addSubview:self.musicDisplay];
    [self.musicDisplay release];
    
    //Help button
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    CGFloat margin = 10.0;
    self.button.frame = CGRectMake(margin, margin, BUTTONWIDTH, BUTTONHEIGHT);
    [self.button setFont:[UIFont fontWithName:@"Arial" size:30.0]];
    [self.button setTitle:[NSString stringWithFormat:@"Help"] 
                 forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor blackColor] 
                      forState:UIControlStateNormal];
    //[self.button addTarget:self action:@selector(helpBackground) forControlEvents:UIControlEventTouchUpInside];
    [self.sheet addSubview:self.button];
    
    
    //Play/pause button
    self.playPause = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.playPause setFont:[UIFont fontWithName:@"Arial" size:30.0]];
    self.playPause.frame = CGRectMake(self.sheet.frame.size.width/2 - BUTTONWIDTH/2, 
                                      self.sheet.frame.size.height-BUTTONHEIGHT-20, 
                                      BUTTONWIDTH, BUTTONHEIGHT);
    [self.playPause setTitle:[NSString stringWithFormat:@"Listen"] 
                 forState:UIControlStateNormal];
    [self.playPause setTitleColor:[UIColor blackColor] 
                      forState:UIControlStateNormal];
    [self.playPause addTarget:self action:@selector(playBackground) forControlEvents:UIControlEventTouchUpInside];
    [self.sheet addSubview:self.playPause];
        
}


-(void)helpBackground {
    [self.button setTitle:[NSString stringWithFormat:@"Back"] 
                 forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor blackColor] 
                      forState:UIControlStateNormal];
    //add button action
    [self.button addTarget:self action:@selector(background) forControlEvents:UIControlEventTouchUpInside];
    
    self.label.text = [NSString stringWithFormat:@"Notes: C, Eflat, F"];
    self.label.center = CGPointMake(self.label.center.x, self.label.center.y-100);

    
    [self.musicDisplay removeFromSuperview];
    self.musicDisplay =  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Kairos3NotesandKeys.tiff"]];
    CGFloat scale = 1.0;
    self.musicDisplay.frame = CGRectMake(0, 0, 
                                         self.musicDisplay.frame.size.width*scale, 
                                         self.musicDisplay.frame.size.height*scale);
    self.musicDisplay.center = CGPointMake(self.sheet.frame.size.width/2, 
                                           self.sheet.frame.size.height-self.musicDisplay.frame.size.height+100);
    [self.sheet addSubview:self.musicDisplay];
    
    [self.playPause removeTarget:nil action:NULL forControlEvents:UIControlEventTouchUpInside];
    [self.playPause addTarget:self action:@selector(playHelpBackground) forControlEvents:UIControlEventTouchUpInside];
}

-(void)lesson {
    [self.musicDisplay removeFromSuperview]; 
    self.label.text = [NSString stringWithFormat:@"Press play to start!\n"
                       "MetroGnome will count off two bars before beginning.\n\n"
                       "Hint: Your first note is C."];
    
    [self.button removeFromSuperview];
    [self.button setTitle:[NSString stringWithFormat:@"Finish"] 
                 forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(finish) forControlEvents:UIControlEventTouchUpInside];
    [self.sheet addSubview:self.button];
    
    [self.playPause removeFromSuperview];
    [self.playPause removeTarget:nil action:NULL forControlEvents:UIControlEventTouchUpInside];
    self.playPause.center = CGPointMake(self.playPause.center.x, self.playPause.center.y-50);
    [self.playPause setTitle:[NSString stringWithFormat:@"Play"] 
                    forState:UIControlStateNormal];
    [self.playPause setTitleColor:[UIColor blackColor] 
                         forState:UIControlStateNormal];
    [self.playPause addTarget:self action:@selector(playLesson) forControlEvents:UIControlEventTouchUpInside];
    [self.sheet addSubview:self.playPause];
    
}

-(void)finish {
    [self pauseLesson];
    [self go];
}

#pragma mark -
#pragma BASS

-(void)playBackground {
    //play notes
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"C Major Blues Scale" ofType:@"mid"];  
    HSTREAM stream=BASS_MIDI_StreamCreateFile(FALSE, [filePath UTF8String], 0, 0, 0, 44100);
    if (BASS_ErrorGetCode()) {
        NSLog(@"Bass error: %i", BASS_ErrorGetCode());
    }
    
    MGInstrument *testInstrument = [[MGInstrument alloc]initWithSoundFont:nil instrumentType:nil];
    
    BASS_MIDI_FONT streamFont[1];
    streamFont[0] = [testInstrument.soundFont getBASSMIDIFONT];
    [testInstrument release];
    
    BASS_MIDI_StreamSetFonts(stream, streamFont, 1); // apply it to the stream
    
    //Enter into bass, but pause immediately
    BASS_ChannelPlay(stream, FALSE);
}

-(void)playHelpBackground {
    //play notes
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Karios3Notes" ofType:@"mid"];  
    HSTREAM stream=BASS_MIDI_StreamCreateFile(FALSE, [filePath UTF8String], 0, 0, 0, 44100);
    if (BASS_ErrorGetCode()) {
        NSLog(@"Bass error: %i", BASS_ErrorGetCode());
    }
    
    MGInstrument *testInstrument = [[MGInstrument alloc]initWithSoundFont:nil instrumentType:nil];
    
    BASS_MIDI_FONT streamFont[1];
    streamFont[0] = [testInstrument.soundFont getBASSMIDIFONT];
    [testInstrument release];
    
    BASS_MIDI_StreamSetFonts(stream, streamFont, 1); // apply it to the stream
    
    //Play
    BASS_ChannelPlay(stream, FALSE);
}

-(void)playLesson {     
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
    
    //Enter into bass, but pause immediately
    BASS_ChannelPlay(stream, FALSE); 

    [self.playPause removeTarget:nil action:NULL forControlEvents:UIControlEventTouchUpInside];
    [self.playPause addTarget:self action:@selector(pauseLesson) forControlEvents:UIControlEventTouchUpInside];
    [self.playPause setTitle:[NSString stringWithFormat:@"Pause"]
                 forState:UIControlStateNormal];
}

-(void)pauseLesson {
    BASS_Pause();
    [self.playPause addTarget:self action:@selector(unpauseLesson) forControlEvents:UIControlEventTouchUpInside];
    [self.playPause setTitle:[NSString stringWithFormat:@"Play"]
                 forState:UIControlStateNormal];
}

-(void)unpauseLesson {
    BASS_Start();
    [self.playPause removeTarget:nil action:NULL forControlEvents:UIControlEventTouchUpInside];
    [self.playPause addTarget:self action:@selector(pauseLesson) forControlEvents:UIControlEventTouchUpInside];
    [self.playPause setTitle:[NSString stringWithFormat:@"Pause"]
                    forState:UIControlStateNormal];
}

/****************************************************************************/

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
