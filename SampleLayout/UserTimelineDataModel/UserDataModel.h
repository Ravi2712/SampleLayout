//
//  UserTimelineDataModel.h
//  SampleLayout
//
//  Created by Ravi on 2/25/16.
//  Copyright © 2016 JayPatel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GetUserData.h"

@interface UserDataModel : NSObject

// User Dictionary

@property (strong , nonatomic) NSDictionary *userDictionary ;

// Images

@property (strong , nonatomic) NSString *bannerImageUrl ;
@property (strong , nonatomic) NSString *profileImageUrl ;

//

@property (strong , nonatomic) NSString *userName ;
@property (strong , nonatomic) NSString *characteristics ;
@property (strong , nonatomic) NSString *websiteUrl ;

// Timeline Data

@property (strong , nonatomic) NSString *timelineImageUrl ;

@property (strong , nonatomic) NSString *titleOfTimeline ;
@property (strong , nonatomic) NSString *duration ;
@property (strong , nonatomic) NSString *specifiedString ;


//

- (id)initWithUserInfoModel:(NSDictionary *)dictionary ;
- (id)initWithUserTimelineInfoModel:(NSDictionary *)dictionary indexOfTimelineView:(NSInteger)index ;


@end
