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
- (IBAction)calculate:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *tipPercentageTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)calculate:(id)sender {

    [self calculateTip];
    
    [self.tipPercentageTextField resignFirstResponder];
    
}

- (void)calculateTip {
    
//    self.tipAmountLabel.text = [NSString stringWithFormat:@"%.2f", ([self.billAmountTextField.text intValue] * 0.15)];
    
    float tipTotal;
    
    tipTotal = [self.billAmountTextField.text intValue] * [self.tipPercentageTextField.text intValue] / 100;
    
    self.tipAmountLabel.text = [NSString stringWithFormat:@"%.2f", tipTotal];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.tipPercentageTextField resignFirstResponder];
}

@end
