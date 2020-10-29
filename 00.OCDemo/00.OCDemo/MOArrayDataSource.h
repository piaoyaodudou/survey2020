//
//  MOArrayDataSource.h
//  00.OCDemo
//
//  Created by moxiaoyan on 2020/8/26.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MOButton.h"
@class MOCellModel;

NS_ASSUME_NONNULL_BEGIN

typedef void(^MOSelectedCell)(MOCellModel *model);
typedef void(^MOConfigureCell)(UITableViewCell *cell, id model);

@interface MOCellModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *vcName;
@property (nonatomic, copy) MOSelectedCell selectedCell;
+ (instancetype)modelWithTitle:(NSString *)title vcName:(NSString *)vcName;
+ (instancetype)modelWithTitle:(NSString *)title selectedCell:(MOSelectedCell)selectedCell;
@end

@interface MOArrayDataSource : NSObject <UITableViewDataSource>
@property (nonatomic, strong) MOButton *btn;
- (instancetype)initSections:(NSArray *)sections cellIndentifier:(NSString *)cellIndentifier configureCell:(MOConfigureCell)configureCell;
- (MOCellModel *)modelAtIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
