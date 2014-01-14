//
//  TempViewController.m
//  TemperatureConvertor
//
//  Created by Anand Joshi on 1/13/14.
//  Copyright (c) 2014 Yahoo! Inc. All rights reserved.
//

#import "TempViewController.h"

@interface TempViewController ()

@property (weak, nonatomic) IBOutlet UITextField *txtFahrenheit;
@property (weak, nonatomic) IBOutlet UITextField *txtCelsius;
@property (assign) BOOL fahrenheitChanged;
@property (assign) BOOL celsiusChanged;

- (IBAction)onTap:(id)sender;
- (IBAction)fahrenheitChanged:(id)sender;
- (IBAction)celsiusChanged:(id)sender;
- (IBAction)onClick:(id)sender;

@end

@implementation TempViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Detect which field has changed
    [self.txtFahrenheit addTarget:self action:@selector(fahrenheitChanged:) forControlEvents:UIControlEventEditingDidEnd];
    [self.txtCelsius addTarget:self action:@selector(celsiusChanged:) forControlEvents:UIControlEventEditingDidEnd];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)fahrenheitChanged:(id)sender {
    NSLog(@"Fahrenheit field changed");
    self.fahrenheitChanged = TRUE;
    self.celsiusChanged = FALSE;
}

- (IBAction)celsiusChanged:(id)sender {
    NSLog(@"Celsius field changed");
    self.fahrenheitChanged = FALSE;
    self.celsiusChanged = TRUE;
}

- (IBAction)onClick:(id)sender {
    if (self.fahrenheitChanged == TRUE && self.celsiusChanged == FALSE) {
        NSLog(@"Convert to Celsius");
        float fahrenheit = [self.txtFahrenheit.text floatValue];
        float celsius = ((fahrenheit - 32) * 5)/9;
        self.txtCelsius.text = [NSString stringWithFormat:@"%.2f", celsius];
    } else {
        NSLog(@"Convert to Fahrenheit");
        float celsius = [self.txtCelsius.text floatValue];
        float fahrenheit = ((celsius * 9) / 5) + 32;
        self.txtFahrenheit.text = [NSString stringWithFormat:@"%.2f", fahrenheit];
    }
}


@end
