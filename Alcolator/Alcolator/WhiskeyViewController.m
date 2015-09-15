//
//  WhiskeyViewController.m
//  Alcolator
//
//  Created by Paul Savage on 14/09/2015.
//  Copyright (c) 2015 Paul Savage. All rights reserved.
//

#import "WhiskeyViewController.h"

@interface WhiskeyViewController ()

@end

@implementation WhiskeyViewController

- (void)sliderValueDidChange:(UISlider *)sender {
    
    NSLog(@"Slider value changed to %f", sender.value);
    
    [self.beerPercentTextField resignFirstResponder];
    
    // first, calculate how much alcohol is in all those beers...
    
    int numberOfBeers = self.beerCountSlider.value;
    
    int ouncesInOneBeerGlass = 12;  // assume they are 12oz beer bottles
    
    float alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue] / 100;
    
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    
    // now, calculate the equivalent amount of whiskey...
    
    float ouncesInOneWhiskeyGlass = 1;
    
    float alcolholPercentageOfWhiskey = 0.4;   // 40% is average
    
    float ouncesOfAlcoholPerWhiskeyGlass = ouncesInOneWhiskeyGlass * alcolholPercentageOfWhiskey;
    
    float numberOfWhiskeyGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWhiskeyGlass;
    
    // decide whether to use "shot"/"shots"
    
    NSString *whiskeyText;
    
    if (numberOfWhiskeyGlassesForEquivalentAlcoholAmount == 1) {
        
        whiskeyText = NSLocalizedString(@"shot", @"singular shot");
        
    } else {
        
        whiskeyText = NSLocalizedString(@"shots", @"plural of shot");
        
    }
    
    // generate the result text, and display it int the title
    
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"Whiskey (%.1f %@)", nil), numberOfWhiskeyGlassesForEquivalentAlcoholAmount, whiskeyText];
    
    self.navigationItem.title = resultText;
}

- (void)buttonPressed:(UIButton *)sender {
    
    [self.beerPercentTextField resignFirstResponder];
    
    // first, calculate how much alcohol is in all those beers...
    
    int numberOfBeers = self.beerCountSlider.value;
    
    int ouncesInOneBeerGlass = 12;  // assume they are 12oz beer bottles
    
    float alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue] / 100;
    
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    
    // now, calculate the equivalent amount of whiskey...
    
    float ouncesInOneWhiskeyGlass = 1;
    
    float alcolholPercentageOfWhiskey = 0.4;   // 40% is average
    
    float ouncesOfAlcoholPerWhiskeyGlass = ouncesInOneWhiskeyGlass * alcolholPercentageOfWhiskey;
    
    float numberOfWhiskeyGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWhiskeyGlass;
    
    // decide whether to use "beer"/"beers" and "glass"/"glasses"
    
    NSString *beerText;
    
    if (numberOfBeers == 1) {
        
        beerText = NSLocalizedString(@"beer", @"singular beer");
        
    } else {
        
        beerText = NSLocalizedString(@"beers", @"plural of beer");
        
    }
    
    NSString *whiskeyText;
    
    if (numberOfWhiskeyGlassesForEquivalentAlcoholAmount == 1) {
        
        whiskeyText = NSLocalizedString(@"shot", @"singular shot");
        
    } else {
        
        whiskeyText = NSLocalizedString(@"shots", @"plural of shot");
        
    }
    
    // generate the result text, and display it on the label
    
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (with %.2f%% alcohol) contains as much alcohol as %.1f %@ of whiskey.", nil), numberOfBeers, beerText, [self.beerPercentTextField.text floatValue], numberOfWhiskeyGlassesForEquivalentAlcoholAmount, whiskeyText];
    
    self.resultLabel.text = resultText;
}

@end
