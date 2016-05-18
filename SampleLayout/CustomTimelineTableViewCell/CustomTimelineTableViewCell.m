//
//  CustomTimelineTableViewCell.m
//  SampleLayout
//
//  Created by Ravi on 2/25/16.
//  Copyright © 2016 JayPatel. All rights reserved.
//

#import "CustomTimelineTableViewCell.h"

@interface CustomTimelineTableViewCell()

@property BOOL cancelsTask;
@property NSURLSessionDataTask *task ;
@property NSURL *activeImageURL ;

@end

@implementation CustomTimelineTableViewCell

-(void)awakeFromNib
{
    self.timelineImageView.contentMode = UIViewContentModeScaleAspectFill ;
    self.cancelsTask = FALSE;
}

-(void)prepareForReuse
{
    self.timelineImageView.contentMode = UIViewContentModeScaleAspectFill ;
    
    if(self.cancelsTask)
    {
        [self.task cancel];
    }
}

// ---- Set Image with UIImageLoader

-(void)setImageForTimeline:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString] ;
    self.activeImageURL = url;
    
    self.task = [[UIImageLoader defaultLoader] loadImageWithURL:url hasCache:^(UIImageLoaderImage *image, UIImageLoadSource loadedFromSource)
    {
        //use cached image
        self.timelineImageView.image = image ;
        self.timelineImageView.contentMode = UIViewContentModeScaleAspectFill ;
    }
    sendingRequest:^(BOOL didHaveCachedImage) {}
    requestCompleted:^(NSError *error, UIImageLoaderImage *image, UIImageLoadSource loadedFromSource) {
    
        //check if url above matches self.activeURL.
        //If they don't match this cells image is going to be different.
        if(!self.cancelsTask && ![self.activeImageURL.absoluteString isEqualToString:urlString]) {
            return;
        }
        
        //if image was downloaded, use it.
        if(loadedFromSource == UIImageLoadSourceNetworkToDisk) {
            self.timelineImageView.image = image;
            self.timelineImageView.contentMode = UIViewContentModeScaleAspectFill ;
        }
    }];
}

-(void)drawRect:(CGRect)rect
{
    // Round Specified Label Corners
    
    self.specifiedTextLabel.layer.cornerRadius = 10.0f ;
    self.specifiedTextLabel.clipsToBounds = YES ;
    
    // Round TimelineImageView and Ovelay View Corners
    
    self.timelineImageView.layer.cornerRadius = 3.0f ;
    self.overlayBlackView.layer.cornerRadius = 3.0f ;
}

@end
