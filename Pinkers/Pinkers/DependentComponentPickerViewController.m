//
//  DependentComponentPickerViewController.m
//  Pinkers
//
//  Created by 冯尧 on 15/8/13.
//  Copyright (c) 2015年 Apress. All rights reserved.
//

#import "DependentComponentPickerViewController.h"

#define kStateComponent 0
#define kZipComponent   1

@interface DependentComponentPickerViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *dependentPicker;

@property (strong, nonatomic) NSDictionary *stateZips;
@property (strong, nonatomic) NSArray *states;
@property (strong, nonatomic) NSArray *zips;
@end

@implementation DependentComponentPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *plistURL = [bundle URLForResource:@"statedictionary" withExtension:@"plist"];
    
    self.stateZips = [NSDictionary
                      dictionaryWithContentsOfURL:plistURL];
    
    NSArray *allStates = [self.stateZips allKeys];
    NSArray *sortedStates = [allStates sortedArrayUsingSelector:@selector(compare:)];
    self.states = sortedStates;
    
    NSString *selectedState = self.states[0];
    self.zips = self.stateZips[selectedState];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)buttonPressed:(id)sender {
    NSInteger stateRow = [self.dependentPicker selectedRowInComponent:kStateComponent];
    NSInteger zipRow = [self.dependentPicker selectedRowInComponent:kZipComponent];
    
    NSString *state = self.states[stateRow];
    NSString *zip = self.zips[zipRow];
    NSString *title = [[NSString alloc]initWithFormat:@"You selected zip code %@.", zip];
    NSString *message = [[NSString alloc] initWithFormat:@"%@ is in %@", zip, state];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

#pragma mark - 
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == kStateComponent) {
        return [self.states count];
    }else
    {
        return [self.zips count];
    }
}

#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == kStateComponent) {
        return self.states[row];
    } else {
        return self.zips[row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == kStateComponent) {
        NSString *selectedState = self.states[row];
        self.zips = self.stateZips[selectedState];
        [self.dependentPicker reloadComponent:kZipComponent];
        [self.dependentPicker selectRow:0 inComponent:kZipComponent animated:YES];
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (component == kZipComponent) {
        return 90;
    } else {
        return 200;
    }
}

@end
