//
//  PokemonCell.h
//  PokeSnipers
//
//  Created by zzd on 16/8/1.
//  Copyright © 2016年 philamlife. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PokemonCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *coordsLabel;
@property (weak, nonatomic) IBOutlet UILabel *untilLabel;

@end
