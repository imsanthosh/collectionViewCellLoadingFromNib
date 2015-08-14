//
//  ViewController.m
//  CollectioVewSample
//
//  Created by Santhosh on 13/08/15.
//  Copyright (c) 2015 Santhosh. All rights reserved.
//

#import "ViewController.h"
#import "SampleCellCollectionViewCell.h"

@interface ViewController () <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *dataSource;
@property (strong, nonatomic) SampleCellCollectionViewCell *cell;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    
    [self sampleCell];

    [_collectionView registerNib:[UINib nibWithNibName:@"SampleCellCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cellID"];
    [_collectionView reloadData];

    
    _dataSource = [NSMutableArray array];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"Mission Impossible, Tom Cruise" forKey:@"title"];
    [dict setObject:@"Do any additional setup after loading the view, typically from a nib." forKey:@"descrp"];
    
    
    [_dataSource addObject:dict];
    
    dict = [NSMutableDictionary dictionary];
    [dict setObject:@"Mdjsfh djfhjsd dskjfhljksdhf dksjfhkjsd kf dkjsfhjksdhfk dsfkjhkdsfh dsfkjhdskjfh dfjkhdkf" forKey:@"title"];
    [dict setObject:@"euwriou eruio shkjdshfkj dfiuiu ewjkhkejwhr fdjhjkdsfdsjhsadhasdlksdsdjhsdfjkhsfkljhdsjfdsfiuiewewoiurioeil" forKey:@"descrp"];
    [_dataSource addObject:dict];
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataSource.count;
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SampleCellCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    [cell configureCellWithDict:[_dataSource objectAtIndex:indexPath.item]];
    
    
    return cell;
}

#pragma mark
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    _cell.frame = collectionView.frame;
    [_cell configureCellWithDict:[_dataSource objectAtIndex:indexPath.item]];
    [_cell setNeedsLayout];
    [_cell layoutIfNeeded];
    
    CGSize size = CGSizeMake(CGRectGetWidth(collectionView.frame),[_cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height);
    
    return size;
}


- (void)sampleCell {
    
    _cell =  [[[NSBundle mainBundle] loadNibNamed:@"SampleCellCollectionViewCell" owner:nil options:nil] firstObject];
    
}
@end
