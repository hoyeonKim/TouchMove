//
//  ViewController.m
//  p238
//
//  Created by SDT-1 on 2014. 1. 7..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    bool holdingImage;
}
@property (weak, nonatomic) IBOutlet UIImageView *ballimage;

@end

@implementation ViewController
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point =[touch locationInView:self.view];
    if(CGRectContainsPoint(self.ballimage.frame, point)){
        holdingImage = YES;
        self.ballimage.transform = CGAffineTransformMakeScale(1.2, 1.2);
    }
}
-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"moved count: %d", [[event allTouches]count]);
    
    if(holdingImage){
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self.view];
        self.ballimage.center = point;
    }
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if(holdingImage){
        self.ballimage.transform = CGAffineTransformIdentity;
        holdingImage = NO;
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
