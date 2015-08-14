//
//  SampleCellCollectionViewCell.m
//  CollectioVewSample
//
//  Created by Santhosh on 13/08/15.
//  Copyright (c) 2015 Santhosh. All rights reserved.
//

#import "SampleCellCollectionViewCell.h"

@interface SampleCellCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation SampleCellCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.titleLabel.preferredMaxLayoutWidth  = self.frame.size.width - 16;
    self.descriptionLabel.preferredMaxLayoutWidth  = self.frame.size.width - 16;

}

- (void)configureCellWithDict:(NSDictionary *)dict {
    
    _titleLabel.text = [dict objectForKey:@"title"];
    _descriptionLabel.text = [dict objectForKey:@"descrp"];
    
}
@end
