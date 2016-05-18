//
//  CustomTimelineTableViewCell.h
//  SampleLayout
//
//  Created by Ravi on 2/25/16.
//  Copyright © 2016 JayPatel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageLoader.h"

@interface CustomTimelineTableViewCell : UITableViewCell

// UI Outlets

@property (strong, nonatomic) IBOutlet UIImageView *timelineImageView;
@property (strong, nonatomic) IBOutlet UIView *overlayBlackView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *durationLabel;
@property (strong, nonatomic) IBOutlet UILabel *specifiedTextLabel;

//

- (void)setImageForTimeline:(NSString *)urlString ;

@end
