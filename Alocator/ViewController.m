//
//  ViewController.m
//  Alocator
//
//  Created by Alessandro Musto on 5/31/16.
//  Copyright © 2016 Lmusto. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()



@end

@implementation ViewController

int ouncesInOneBeerGlass = 12;
float ouncesInOneWineGlass = 5;
float alcoholPercentageOfWine = 0.13;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)textFieldDidChange:(UITextField *)sender {
    NSString *enteredText = sender.text;
    float enteredNumber = [enteredText floatValue];
    if (enteredNumber ==0) {
        sender.text = nil;
    }
    
}
- (IBAction)sliderDidChange:(UISlider *)sender {

    int numberOfBeers = self.beerCountSlider.value;
    float alcoholPercentageOfBeer = [self.beerPercentageTextField.text floatValue] / 100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    
    float ouncesOfAlcoholPerWineGlass = ouncesInOneWineGlass *alcoholPercentageOfWine;
    float numberOfWineGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWineGlass;
    
    NSString *wineText;
    if (numberOfWineGlassesForEquivalentAlcoholAmount == 1) {
        wineText = NSLocalizedString(@"glass", @"singular glass");
    } else {
        wineText = NSLocalizedString(@"glasses", @"plural of glass");
    }
    
    
        self.navigationItem.title = [NSString stringWithFormat:NSLocalizedString
        (@"Wine (%.1f %@)", nil),
          numberOfWineGlassesForEquivalentAlcoholAmount, wineText];

    
    [self.beerPercentageTextField resignFirstResponder];
}
- (IBAction)buttonPressed:(id)sender {
    
    [self.beerPercentageTextField resignFirstResponder];
    
    int numberOfBeers = self.beerCountSlider.value;
    float alcoholPercentageOfBeer = [self.beerPercentageTextField.text floatValue] / 100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    
    float ouncesOfAlcoholPerWineGlass = ouncesInOneWineGlass * alcoholPercentageOfWine;
    float numberOfWineGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWineGlass;
    
    
    NSString *beerText;
    
    if (numberOfBeers == 1) {
        beerText = NSLocalizedString(@"beer", @"singular beer");
    } else {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    NSString *wineText;
    if (numberOfWineGlassesForEquivalentAlcoholAmount == 1) {
        wineText = NSLocalizedString(@"glass", @"singular glass");
    } else {
        wineText = NSLocalizedString(@"glasses", @"plural of glass");
    }
    // generate the result text, and display it on the label
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString
                            (@"%d %@ (with %.2f%% alcohol) contains as much alcohol as %.1f %@ of wine.", nil),
                            numberOfBeers, beerText,  [self.beerPercentageTextField.text floatValue], numberOfWineGlassesForEquivalentAlcoholAmount, wineText];
    self.resultLabel.text = resultText;
    
    self.navigationItem.title = [NSString stringWithFormat:NSLocalizedString
                             (@"Wine (%.1f %@)", nil),
                             numberOfWineGlassesForEquivalentAlcoholAmount, wineText];
    
    
}

- (IBAction)tapGestureDidFire:(UITapGestureRecognizer *)sender {
    [self.beerPercentageTextField resignFirstResponder];
}


@end
