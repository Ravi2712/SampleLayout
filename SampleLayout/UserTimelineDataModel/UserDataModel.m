//
//  UserTimelineDataModel.m
//  SampleLayout
//
//  Created by Ravi on 2/25/16.
//  Copyright © 2016 JayPatel. All rights reserved.
//

#import "UserDataModel.h"

@implementation UserDataModel

// ----------------- Get User Information  -------------------- //

-(id)initWithUserInfoModel:(NSDictionary *)dictionary
{
    self = [super init];
    if (self)
    {
        self.userDictionary = dictionary ;
        [self setUserInformationModel] ;
    }
    return self;
}

-(void)setUserInformationModel
{
    self.bannerImageUrl = [_userDictionary valueForKey:@"banner_image"] ;
    self.profileImageUrl = [_userDictionary valueForKey:@"profile_image"] ;
    self.userName = [_userDictionary valueForKey:@"user_name"] ;
    self.characteristics = [_userDictionary valueForKey:@"characteristics"] ;
    self.websiteUrl = [_userDictionary valueForKey:@"website_url"] ;
}


// ----------------- Get User Timeline Information  -------------------- //

- (id)initWithUserTimelineInfoModel:(NSDictionary *)dictionary indexOfTimelineView:(NSInteger)index
{
    self = [super init];
    if (self)
    {
        // Any custom setup work goes here
        
        self.userDictionary = dictionary ;
        [self setModelWithTimeLineIndex:index] ;
    }
    return self;
}

-(void)setModelWithTimeLineIndex:(NSInteger)index
{
    // Get Timeline Information
    
    NSArray *data = [_userDictionary valueForKey:@"user_timeline_info"] ;
  
    self.timelineImageUrl = [[data objectAtIndex:index] valueForKey:@"image_url"] ;
    self.titleOfTimeline = [[data objectAtIndex:index] valueForKey:@"title"] ;
    self.duration = [[data objectAtIndex:index] valueForKey:@"duration"] ;
    self.specifiedString = [[data objectAtIndex:index] valueForKey:@"specified_string"] ;
}

@end
