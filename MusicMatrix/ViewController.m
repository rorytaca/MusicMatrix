//
//  ViewController.m
//  MusicMatrix
//
//  Created by Rory Taca on 2/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#include <stdio.h>

@implementation ViewController
@synthesize midCs;


NSTimer *repeater;

int matrix[19][16];

int savedOne[19][16];
int savedTwo[19][16];
int savedThree[19][16];


int colToPlay;
int playHigh;

float tempo = 250;

int holdOne = 0;
int holdTwo = 0;
int holdThree = 0;



                     
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //INITIALIZE MATRIX UPON LOAD: ALL VALUES ZERO
    for (int i=0;i < 19;i++){
        for (int j=0;j<16;j++){
            matrix[i][j] =0;
        }
    }
    
    colToPlay = 0;
    playHigh = 0;
    
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"metalbackground.png"]];
    
    
    for (int i=0;i < 19;i++){
        for (int j=0;j<16;j++){
            matrix[i][j] =0;
            
            int m = i*16;
            int n = j+1;
            int findTag = m+n;
            

                UIView *findButton = [self.view viewWithTag:findTag]; 
                [findButton setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"offsmallbutton.png"]]];

            UIView *slider= [self.view viewWithTag:400];
            [(UISlider *)slider setThumbImage:[UIImage imageNamed:@"thumb.png"] 
                            forState: UIControlStateNormal];
            [(UISlider *)slider setThumbImage:[UIImage imageNamed:@"thumb.png"] 
                                     forState: UIControlStateHighlighted];
            
        }
    }

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{ 
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

- (IBAction)gridButtonPressed:(UIButton *)sender {
    int tagNum = sender.tag;
    int row = tagNum/16;
    int col = (tagNum%16)-1;
    if (col == -1)
        col = 15;
    if (col == 15)
        row = row - 1;
    
    if (matrix[row][col] == 0){
        matrix[row][col] = 1;
        if (row < 8) {
            UIView *findButton = sender; 
            [findButton setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"redbuttonon.png"]]];
            
        } else if (row < 15) {
            UIView *findButton = sender; 
            [findButton setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"bluebuttonon.png"]]];
        } else if (row < 20) {
            UIView *findButton = sender; 
            [findButton setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"greenbuttonon.png"]]];
        }
    }
    else if (matrix[row][col] == 1){
        matrix[row][col] = 0;
        //[sender setBackgroundColor:[UIColor clearColor]];
        
     
            UIView *findButton = sender; 
            [findButton setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"offsmallbutton.png"]]];
            
        

        
        
        
    } 
    NSLog(@"%i,%i", row, col);


}

-(void)playColumn:(int) next {
    if (matrix[0][next] == 1){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cTwoPiano"ofType:@"wav"];
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef) [NSURL fileURLWithPath:path], &soundID);
        AudioServicesPlaySystemSound (soundID);   
    }
    if (matrix[1][next] == 1){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"bPiano"ofType:@"wav"];
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef) [NSURL fileURLWithPath:path], &soundID);
        AudioServicesPlaySystemSound (soundID);   
    }
    if (matrix[2][next] == 1){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"aPiano"ofType:@"wav"];
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef) [NSURL fileURLWithPath:path], &soundID);
        AudioServicesPlaySystemSound (soundID);   
    }
    if (matrix[3][next] == 1){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"gPiano"ofType:@"wav"];
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef) [NSURL fileURLWithPath:path], &soundID);
        AudioServicesPlaySystemSound (soundID);   
    }
    if (matrix[4][next] == 1){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"fPiano"ofType:@"wav"];
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef) [NSURL fileURLWithPath:path], &soundID);
        AudioServicesPlaySystemSound (soundID);   
    }
    if (matrix[5][next] == 1){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"ePiano"ofType:@"wav"];
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef) [NSURL fileURLWithPath:path], &soundID);
        AudioServicesPlaySystemSound (soundID);   
    }
    if (matrix[6][next] == 1){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"dPiano"ofType:@"wav"];
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef) [NSURL fileURLWithPath:path], &soundID);
        AudioServicesPlaySystemSound (soundID);   
    }
    if (matrix[7][next] == 1){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cPiano"ofType:@"wav"];
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef) [NSURL fileURLWithPath:path], &soundID);
        AudioServicesPlaySystemSound (soundID);   
    }
    if (matrix[8][next] == 1){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"hBass"ofType:@"wav"];
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef) [NSURL fileURLWithPath:path], &soundID);
        AudioServicesPlaySystemSound (soundID);   
        
    }
    if (matrix[9][next] == 1){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"aBass"ofType:@"wav"];
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef) [NSURL fileURLWithPath:path], &soundID);
        AudioServicesPlaySystemSound (soundID);   
    }
    if (matrix[10][next] == 1){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"gBass"ofType:@"wav"];
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef) [NSURL fileURLWithPath:path], &soundID);
        AudioServicesPlaySystemSound (soundID);   
    }
    if (matrix[11][next] == 1){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"fBass"ofType:@"wav"];
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef) [NSURL fileURLWithPath:path], &soundID);
        AudioServicesPlaySystemSound (soundID);   
    }
    if (matrix[12][next] == 1){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"eBass"ofType:@"wav"];
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef) [NSURL fileURLWithPath:path], &soundID);
        AudioServicesPlaySystemSound (soundID);   
    }
    if (matrix[13][next] == 1){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"dBass"ofType:@"wav"];
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef) [NSURL fileURLWithPath:path], &soundID);
        AudioServicesPlaySystemSound (soundID);    
    }
    if (matrix[14][next] == 1){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cBass"ofType:@"wav"];
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef) [NSURL fileURLWithPath:path], &soundID);
        AudioServicesPlaySystemSound (soundID);   
    }
    if (matrix[15][next] == 1){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"openHi"ofType:@"wav"];
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef) [NSURL fileURLWithPath:path], &soundID);
        AudioServicesPlaySystemSound (soundID);   
    }
    if (matrix[16][next] == 1){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"closedHi"ofType:@"wav"];
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef) [NSURL fileURLWithPath:path], &soundID);
        AudioServicesPlaySystemSound (soundID);      
    }
    if (matrix[17][next] == 1){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"snareDrum"ofType:@"wav"];
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef) [NSURL fileURLWithPath:path], &soundID);
        AudioServicesPlaySystemSound (soundID);   
    }
    if (matrix[18][next] == 1){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"bassDrum"ofType:@"wav"];
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef) [NSURL fileURLWithPath:path], &soundID);
        AudioServicesPlaySystemSound (soundID);   
    }
}

//THIS IS WHEN YOU STOP!
-(void)readThrough {
    [self playColumn:colToPlay];
    colToPlay++;
    if (colToPlay == 16) 
        colToPlay = 0;
}

- (IBAction)playPressed:(id)sender {
    float inbetweenNotes = 60/tempo;
    NSLog(@"%f", inbetweenNotes);
    if (playHigh == 0) {
         playHigh = 1;
        [sender setTitle:(@"PAUSE") forState:UIControlStateNormal];
         repeater = [NSTimer scheduledTimerWithTimeInterval:inbetweenNotes
                                     target:self
                                   selector:@selector(readThrough)
                                   userInfo:nil
                                    repeats:YES];
    } else if (playHigh == 1) {
        playHigh = 0;
        [repeater invalidate];
        repeater = nil;
        [sender setTitle:(@"PLAY") forState:UIControlStateNormal];

    }
}

- (IBAction)clearPressed:(id)sender {
    for (int i=0;i < 19;i++){
        for (int j=0;j<16;j++){
            matrix[i][j] =0;
            
            int m = i*16;
            int n = j+1;
            int findTag = m+n;
            
            UIView *findButton = [self.view viewWithTag:findTag]; 
            //[findButton setBackgroundColor:[UIColor clearColor]];

                 [findButton setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"offsmallbutton.png"]]];
        }
    }
}

- (IBAction)rewPressed:(id)sender {
    colToPlay = 0;
}

- (IBAction)sliderChanged:(UISlider *)sender {
    tempo = sender.value;
}

- (IBAction)savePressed:(id)sender {
    if(holdOne == 0) {
        holdOne = 1;
        
        //copy values of matrix into savedOne.
        for (int i=0;i < 19;i++){
            for (int j=0;j<16;j++){
                savedOne[i][j] = matrix[i][j];
            }
        }
        [sender setTitle:(@"LOAD1") forState:UIControlStateNormal];
    } else if (holdOne == 1) {
        //load in the values of saved one.
        //clear
        for (int i=0;i < 19;i++){
            for (int j=0;j<16;j++){
                matrix[i][j] =0;
                
               
                int findTag = (i*16)+j+1;
                
                UIView *findButton = [self.view viewWithTag:findTag]; 
                [findButton setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"offsmallbutton.png"]]];
            }
        }
        //copy values of matrix into savedOne.
        for (int i=0;i < 19;i++){
            for (int j=0;j<16;j++){
                matrix[i][j] = savedOne[i][j];
                if (savedOne[i][j] == 1) {
                    
                    int findTag = (i*16)+j+1;
                    UIView *findButton = [self.view viewWithTag:findTag];
                    if (i < 8) {
                        [findButton setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"redbuttonon.png"]]];
                        
                    } else if (i < 15) {
                        [findButton setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"bluebuttonon.png"]]];
                    } else if (i < 20) {
                        [findButton setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"greenbuttonon.png"]]];
                    }

                    
                } else if (savedOne[i][j] == 0) {
                    UIView *findButton = sender; 
                    [findButton setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"offsmallbutton.png"]]];  
                }
            }
        }
    }
    
    
}
- (IBAction)saveTwoPressed:(id)sender {
    if(holdTwo== 0) {
        holdTwo = 1;
        
        //copy values of matrix into savedOne.
        for (int i=0;i < 19;i++){
            for (int j=0;j<16;j++){
                savedTwo[i][j] = matrix[i][j];
            }
        }
        [sender setTitle:(@"LOAD2") forState:UIControlStateNormal];
    } else if (holdTwo == 1) {
        //clear
        for (int i=0;i < 19;i++){
            for (int j=0;j<16;j++){
                matrix[i][j] =0;
                
                
                int findTag = (i*16)+j+1;
                
                UIView *findButton = [self.view viewWithTag:findTag]; 
                [findButton setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"offsmallbutton.png"]]];
            }
        }

        //load in the values of saved one.
        //copy values of matrix into savedOne.
        for (int i=0;i < 19;i++){
            for (int j=0;j<16;j++){
                matrix[i][j] = savedTwo[i][j];
                if (savedTwo[i][j] == 1) {
                    
                    int findTag = (i*16)+j+1;
                    UIView *findButton = [self.view viewWithTag:findTag];
                    if (i < 8) {
                        [findButton setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"redbuttonon.png"]]];
                        
                    } else if (i < 15) {
                        [findButton setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"bluebuttonon.png"]]];
                    } else if (i < 20) {
                        [findButton setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"greenbuttonon.png"]]];
                    }
                    
                    
                } else if (savedTwo[i][j] == 0) {
                    UIView *findButton = sender; 
                    [findButton setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"offsmallbutton.png"]]];  
                }
            }
        }
    }
    
    

}
- (IBAction)saveThreePressed:(id)sender {
    if(holdThree == 0) {
        holdThree = 1;
        
        //copy values of matrix into savedOne.
        for (int i=0;i < 19;i++){
            for (int j=0;j<16;j++){
                savedThree[i][j] = matrix[i][j];
            }
        }
        [sender setTitle:(@"LOAD3") forState:UIControlStateNormal];
    } else if (holdThree == 1) {
        //clear
        for (int i=0;i < 19;i++){
            for (int j=0;j<16;j++){
                matrix[i][j] =0;
                
                
                int findTag = (i*16)+j+1;
                
                UIView *findButton = [self.view viewWithTag:findTag]; 
                [findButton setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"offsmallbutton.png"]]];
            }
        }

        //load in the values of saved one.
        //copy values of matrix into savedOne.
        for (int i=0;i < 19;i++){
            for (int j=0;j<16;j++){
                matrix[i][j] = savedThree[i][j];
                if (savedThree[i][j] == 1) {
                    
                    int findTag = (i*16)+j+1;
                    UIView *findButton = [self.view viewWithTag:findTag];
                    if (i < 8) {
                        [findButton setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"redbuttonon.png"]]];
                        
                    } else if (i < 15) {
                        [findButton setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"bluebuttonon.png"]]];
                    } else if (i < 20) {
                        [findButton setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"greenbuttonon.png"]]];
                    }
                    
                    
                } else if (savedThree[i][j] == 0) {
                    UIView *findButton = sender; 
                    [findButton setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"offsmallbutton.png"]]];  
                }
            }
        }
    }
    
    

}

- (IBAction)clearOnePressed:(id)sender {
    for (int i=0;i < 19;i++){
        for (int j=0;j<16;j++){
            savedOne[i][j] = 0;
 
        }
    }
    holdOne = 0;
    UIView *findButton = [self.view viewWithTag:401];
    [(UIButton *)findButton setTitle:(@"SAVE1") forState:UIControlStateNormal];
}
- (IBAction)clearTwoPressed:(id)sender {
    for (int i=0;i < 19;i++){
        for (int j=0;j<16;j++){
            savedTwo[i][j] = 0;
            
        }
    }
    holdTwo = 0;
    UIView *findButton = [self.view viewWithTag:402];
    [(UIButton *)findButton setTitle:(@"SAVE2") forState:UIControlStateNormal];
}
- (IBAction)clearThreePressed:(id)sender {
    for (int i=0;i < 19;i++){
        for (int j=0;j<16;j++){
            savedThree[i][j] = 0;
            
        }
    }
    holdThree = 0;
    UIView *findButton = [self.view viewWithTag:403];
    [(UIButton *)findButton setTitle:(@"SAVE3") forState:UIControlStateNormal];
}

- (IBAction)clearTop:(id)sender {
    for (int i=0;i < 8;i++){
        for (int j=0;j<16;j++){
            //change button graphic
            int findTag = (i*16)+j+1;
            UIView *findButton = [self.view viewWithTag:findTag];
            [findButton setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"offsmallbutton.png"]]];
            //change matrix value
            matrix[i][j] = 0;
        }
    }

}
- (IBAction)clearMid:(id)sender {
    for (int i=8;i < 15;i++){
        for (int j=0;j<16;j++){
            //change button graphic
            int findTag = (i*16)+j+1;
            UIView *findButton = [self.view viewWithTag:findTag];
            [findButton setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"offsmallbutton.png"]]];
            //change matrix value
            matrix[i][j] = 0;
        }
    }
}
- (IBAction)clearLow:(id)sender {
    for (int i=15;i < 19;i++){
        for (int j=0;j<16;j++){
            //change button graphic
            int findTag = (i*16)+j+1;
            UIView *findButton = [self.view viewWithTag:findTag];
            [findButton setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"offsmallbutton.png"]]];
            //change matrix value
            matrix[i][j] = 0;
        }
    }

}



@end
