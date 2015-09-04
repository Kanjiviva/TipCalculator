//
//  ViewController.m
//  TipCalculatorApp
//
//  Created by Steve on 2015-09-04.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;

@property (weak, nonatomic) IBOutlet UITextField *tipPercentageTextField;
@property (weak, nonatomic) IBOutlet UISlider *adjustTipPercentage;
- (IBAction)adjustTipPercentage:(UISlider *)sender;

@property (nonatomic) float tipTotal;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.adjustTipPercentage.minimumValue = 0;
    self.adjustTipPercentage.maximumValue = 100;
    self.adjustTipPercentage.continuous = YES;
    
    [self delegateMethod];
    
    [self calculateTip];
}

- (void)delegateMethod {
    [self.adjustTipPercentage addTarget:self action:@selector(roundValue) forControlEvents:UIControlEventValueChanged];
    
    [self.tipPercentageTextField addTarget:self
                                    action:@selector(tipTextFieldDidChange)
                          forControlEvents:UIControlEventEditingChanged];
    
    [self.billAmountTextField addTarget:self
                                 action:@selector(totalAmountTextFieldDidChange)
                       forControlEvents:UIControlEventEditingChanged];
}

#pragma mark - Helper methods

- (float)calculateTip {
    
    self.tipTotal = [self.billAmountTextField.text floatValue] * [self.tipPercentageTextField.text floatValue] / 100;
    
    return self.tipTotal;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];

}

- (void)roundValue{
    self.adjustTipPercentage.value = round(self.adjustTipPercentage.value);
}

- (void)tipTextFieldDidChange {
    if ([self.tipPercentageTextField.text floatValue] >= 100) {
        self.tipPercentageTextField.text = @"100";
    }
    self.adjustTipPercentage.value = [self.tipPercentageTextField.text intValue];
    [self changeTipLabelValue];
}

- (void)changeTipLabelValue {
    self.tipAmountLabel.text = [NSString stringWithFormat:@"%.02f", [self calculateTip]];

}

- (void)totalAmountTextFieldDidChange {
    [self changeTipLabelValue];
}

#pragma mark - IBAction

- (IBAction)adjustTipPercentage:(UISlider *)sender {

    self.tipPercentageTextField.text = [NSString stringWithFormat:@"%.0f", sender.value];
    [self changeTipLabelValue];
    
}
//
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    return ![string containsString:@" "];
//
//}


@end
