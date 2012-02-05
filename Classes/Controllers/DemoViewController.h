//
//  DemoViewController.h
//  MetroGnomeiPad
//
//  Created by Alexander Pease on 2/4/12.
//  Copyright (c) 2012 Princeton University. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "MGSheetMusicView.h"

@class MGSheetMusicView;

@interface MGDemoViewController : UIViewController {
    MGSheetMusicView *_sheet;
    UILabel *_label;
    UIImageView *_logo;
    UIImageView *_musicDisplay;
    UIButton *_button;
    UIButton *_playPause;
    int _progress;
}
@property(nonatomic,retain)MGSheetMusicView *sheet;
@property(nonatomic,retain)UILabel *label;
@property(nonatomic,retain)UIImageView *logo;
@property(nonatomic,retain)UIImageView *musicDisplay;
@property(nonatomic,retain)UIButton *button;
@property(nonatomic,retain)UIButton *playPause;
@property(readwrite,assign)int progress;

-(void)go; //Starts demo
-(void)explain; //Explains lesson
-(void)background;//Teaches blues scale
-(void)play;
@end
