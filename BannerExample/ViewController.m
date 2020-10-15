//
//  Copyright (C) 2014 Google, Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import <GoogleMobileAds/GoogleMobileAds.h>

#import "ViewController.h"

@implementation ViewController

- (id) init
{
    self = [super init];
    return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
    
    UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
   NSInteger viewcount= 60;
       for(int i = 0; i< viewcount; i++) {

          CGFloat y = i * 50;
          
           DFPBannerView* bannerView = [[DFPBannerView alloc] initWithAdSize:kGADAdSizeBanner];

           // Replace this ad unit ID with your own ad unit ID.
           bannerView.adUnitID = @"...";
           bannerView.rootViewController = self;
             self.view.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];
             
             bannerView.frame = CGRectMake(0, y, 320, 50);
             
             DFPRequest *request = [DFPRequest request];
           // Requests test ads on devices you specify. Your test device ID is printed to the console when
           // an ad request is made. GADBannerView automatically returns test ads when running on a
           // simulator.
//           request.testDevices = @[ kGADSimulatorID ];
           request.customTargeting = @{@"pos": @"smartphone_top", @"app": @"staging"};
           [bannerView loadRequest:request];
           
           
          [scrollview addSubview:bannerView];
       }
    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 50 *viewcount);
    [self.view addSubview:scrollview];
}

@end
