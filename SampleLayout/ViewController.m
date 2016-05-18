//
//  ViewController.m
//  SampleLayout
//
//  Created by Ravi on 2/25/16.
//  Copyright © 2016 JayPatel. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //  Get User Data Disctionary
    
    _userDataDictionary = [GetUserData userDataDictionary] ;
    
    
    //  Set Delegates and Datasource for TableView
    
    self.timelineTableView.delegate = self ;
    self.timelineTableView.dataSource = self ;
    
    // Set user Information
    
    [self setUserInformation] ;
    
    // Do Some View Customization
    
    [self viewCustomization] ;
}

#pragma mark - UI Customization

-(void)viewCustomization
{
    // Create Round for profile image
    
    self.profileImageContainerView.layer.cornerRadius = 35.0f ;
}

#pragma mark - Set User Information

-(void)setUserInformation
{
    _userModel = [[UserDataModel alloc] initWithUserInfoModel:_userDataDictionary] ;
    
    // Set Images
    
    NSURL *bannerImageUrl = [NSURL URLWithString:_userModel.bannerImageUrl] ;
    [self setImageFromUrl:_bannerImage url:bannerImageUrl] ;
    
    NSURL *profileImageUrl = [NSURL URLWithString:_userModel.profileImageUrl] ;
    [self setImageFromUrl:_profileImage url:profileImageUrl] ;
    
    // Set User Information
    
    self.userNameLabel.text = _userModel.userName ;
    self.characteristicLabel.text = _userModel.characteristics ;
    
    [self.userWebsiteUrl setTitle:_userModel.websiteUrl forState:UIControlStateNormal] ;
}

-(void)setImageFromUrl:(UIImageView *)imageView url:(NSURL *)url
{
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            if (image) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    imageView.image = image ;
                });
            }
        }
    }];
    
    [task resume];
}


#pragma mark - UITableview Delegates and Datasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *timelineArray = [_userDataDictionary valueForKey:@"user_timeline_info"] ;
    return timelineArray.count ;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"CellIdentifier" ;
    
    CustomTimelineTableViewCell *cell = (CustomTimelineTableViewCell *) [tableView dequeueReusableCellWithIdentifier:identifier] ;
    if (cell == nil)
    {
        cell = [[CustomTimelineTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    UserDataModel *timelineInfoModel = [[UserDataModel alloc] initWithUserTimelineInfoModel:_userDataDictionary indexOfTimelineView:indexPath.row] ;
    
    // Set TableView Cell Labels
    
    cell.titleLabel.text = timelineInfoModel.titleOfTimeline ;
    cell.durationLabel.text = timelineInfoModel.duration ;
    cell.specifiedTextLabel.text = timelineInfoModel.specifiedString ;
    
    cell.tag = indexPath.row ;
    
   
    
    return cell ;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomTimelineTableViewCell *customCell = (CustomTimelineTableViewCell *) cell ;
    
    UserDataModel *timelineInfoModel = [[UserDataModel alloc] initWithUserTimelineInfoModel:_userDataDictionary indexOfTimelineView:indexPath.row] ;
    
    // Set Timeline Image
    
    [customCell setImageForTimeline:timelineInfoModel.timelineImageUrl] ;
    
    // Disable Highlight on row selection
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone ;
}

#pragma mark - UIButton Actions

- (IBAction)userWebsiteButtonClicked:(id)sender
{
    UIButton *btn = (UIButton *) sender ;
    
    NSURL *url = [NSURL URLWithString:btn.titleLabel.text] ;
    [[UIApplication sharedApplication] openURL:url] ;
}



// -----

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
