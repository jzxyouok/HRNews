//
//  FNTabBarController.m
//  FourNews
//
//  Created by admin on 16/3/27.
//  Copyright © 2016年 天涯海北. All rights reserved.
//

#import "FNTabBarController.h"
#import "FNNewsViewController.h"
#import "FNReadViewController.h"
#import "FNAVViewController.h"
#import "FNTopicViewController.h"
#import "FNMeController.h"
#import "FNNavigationController.h"

@interface FNTabBarController () <UITabBarDelegate>

@property (nonatomic, strong) FNNewsViewController *newsVC;
@property (nonatomic, strong) FNReadViewController *readVC;
@property (nonatomic, strong) FNAVViewController *avVC;
@property (nonatomic, strong) FNTopicViewController *topicVC;
@property (nonatomic, strong) FNMeController *meVC;

@end


@implementation FNTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加自控制器
    [self setChildControllers];
    
    [self.tabBar setTintColor:[UIColor redColor]];
}

- (void)setChildControllers
{
    FNNewsViewController *newsVC = [[FNNewsViewController alloc] init];
    self.newsVC = newsVC;
    [self setupChildController:self.newsVC title:@"新闻" image:@"tabbar_icon_news_normal" selectedImage:@"tabbar_icon_news_highlight"];
    
    FNReadViewController *readVC = [[FNReadViewController alloc] init];
    self.readVC = readVC;
    [self setupChildController:self.readVC title:@"阅读" image:@"tabbar_icon_reader_normal" selectedImage:@"tabbar_icon_reader_highlight"];
    
    FNAVViewController *avVC = [[FNAVViewController alloc] init];
    self.avVC = avVC;
    [self setupChildController:self.avVC title:@"视听" image:@"tabbar_icon_media_normal" selectedImage:@"tabbar_icon_media_highlight"];
    
    FNTopicViewController *topicVC = [[FNTopicViewController alloc] init];
    self.topicVC = topicVC;
    [self setupChildController:self.topicVC title:@"话题" image:@"tabbar_icon_found_normal" selectedImage:@"tabbar_icon_found_highlight"];
    
    
    
//    FNMeController *meVC = [[FNMeController alloc] init];
//    self.meVC = meVC;
    UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"FNMeController" bundle:nil];
    FNMeController * meVC = [storyBoard instantiateInitialViewController];
    meVC.title = @"我";
    meVC.tabBarItem.image = [UIImage imageWithOriginImage:[UIImage imageNamed:@"tabbar_icon_found_normal"]];
    meVC.tabBarItem.selectedImage = [UIImage imageWithOriginImage:[UIImage imageNamed:@"tabbar_icon_me_highlight"]];
    [self addChildViewController:meVC];

}

- (void)setupChildController:(UIViewController *)controller title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectesImage
{
    controller.title = title;
    controller.navigationItem.title = nil;;
    FNNavigationController *nav = [[FNNavigationController alloc] initWithRootViewController:controller];
    
    nav.tabBarItem.image = [UIImage imageWithOriginImage:[UIImage imageNamed:image]];
    nav.tabBarItem.selectedImage = [UIImage imageWithOriginImage:[UIImage imageNamed:selectesImage]];
    
    [self addChildViewController:nav];
}


- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if ([item.title isEqualToString:@"新闻"]) {
        if (self.newsBtnBlock) {
            self.newsBtnBlock();
        }
    }
}

@end
