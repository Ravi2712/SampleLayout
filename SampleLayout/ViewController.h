//
//  ViewController.h
//  SampleLayout
//
//  Created by Ravi on 2/25/16.
//  Copyright © 2016 JayPatel. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GetUserData.h"
#import "UserDataModel.h"

#import "CustomTimelineTableViewCell.h"

@interface ViewController : UIViewController < UITableViewDataSource , UITableViewDelegate >

// User Dictionary

@property (strong , nonatomic) NSDictionary *userDataDictionary ;

// User Profile outlets

@property (strong, nonatomic) IBOutlet UIImageView *bannerImage;

@property (strong, nonatomic) IBOutlet UIView *profileImageContainerView;
@property (strong, nonatomic) IBOutlet UIImageView *profileImage;

@property (strong, nonatomic) IBOutlet UILabel *userNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *characteristicLabel;
@property (strong, nonatomic) IBOutlet UIButton *userWebsiteUrl;

@property (strong, nonatomic) IBOutlet UITableView *timelineTableView;

// User Model

@property (strong , nonatomic) UserDataModel *userModel ;

// UI Actions

- (IBAction)userWebsiteButtonClicked:(id)sender;

@end

