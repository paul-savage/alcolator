//
//  ViewController.h
//  Alcolator
//
//  Created by Paul Savage on 14/09/2015.
//  Copyright (c) 2015 Paul Savage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *beerPercentTextField;
@property (weak, nonatomic) IBOutlet UISlider *beerCountSlider;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

- (void)buttonPressed:(UIButton *)sender;

@end

