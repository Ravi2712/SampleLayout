//
//  GetUserData.m
//  SampleLayout
//
//  Created by Ravi on 2/25/16.
//  Copyright © 2016 JayPatel. All rights reserved.
//

#import "GetUserData.h"

@implementation GetUserData

+(NSDictionary *)userDataDictionary
{
    // Read plist from bundle and get Root Dictionary out of it
    NSDictionary *userDictionary = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ChristopherTimelineDataBase" ofType:@"plist"]] ;
    
    return userDictionary ;
}

@end
