//
//  ViewController.m
//  Masonry
//
//  Created by apple on 16/1/27.
//  Copyright © 2016年 sunco. All rights reserved.
//

/**
 Masonry常用的方法：
 1、[blueView mas_makeConstraints:<#^(MASConstraintMaker *make)block#>]; 这个方法只会给控件添加新的约束；
 2、[blueView mas_remakeConstraints:<#^(MASConstraintMaker *make)block#>]; 这个方法会将控件以前的约束都删除，然后添加新的约束；
 3、[blueView mas_updateConstraints:<#^(MASConstraintMaker *make)block#>]; 修改控件以前的某些约束。
 
 Masonry常用的约束类型：
 1、尺寸：width\height\size；
 2、边界：left\leading\right\trailing\top\bottom；
 3、中心点：center\centerX\centerY；
 4、边界：edges。
 */
#import "ViewController.h"
/**
 要把下面的宏放在"Masonry.h"头文件的前边，因为后边的"Masonry.h"头文件要来识别这些宏；
 如果定义了MAS_SHORTHAND宏，则代码中就可以用不带"mas_"前缀的方法或属性了；
 如果不定义了MAS_SHORTHAND_GLOBALS宏，则只有mas_equalTo会对参数进行自动包装，equalTo不能对参数进行自动包装。如果定义了这个宏，则mas_equalTo和equalTo都能对参数进行自动包装，此时这两个没有区别。
 */
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self test1];
    
//    [self test2];
    
//    [self test3];
    
//    [self test4];
    
//    [self test5];
    
//    [self test6];
    
//    [self text7];
    
//    [self text8];
    
//    [self text9];
}

#pragma mark ————— 蓝色视图粘着父控件的右上角 间距是20 —————
-(void)test1
{
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(100);  // 当定义了MAS_SHORTHAND_GLOBALS宏后，mas_equalTo和equalTo都会对参数进行自动包装。
        make.width.mas_equalTo(100);
        make.right.equalTo(self.view.mas_right).offset(-20);
        make.top.equalTo(self.view.mas_top).offset(20);
    }];
}

#pragma mark ————— 蓝色视图粘着父控件的右上角 间距是20 —————
-(void)test2
{
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(100);//宽度和高度约束可以写在一起(and可写可不写，and的意义就是增加代码的可读性)
        make.right.equalTo(self.view.right).offset(-20);  //"mas_right"也可以用"right"代替
        make.top.equalTo(self.view.top).offset(20);
    }];
}

#pragma mark ————— 蓝色视图粘着父控件的右上角 间距是20 —————
-(void)test3
{
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(100, 100));
//        make.size.mas_equalTo(100);
//        make.size.equalTo([NSValue valueWithCGSize:CGSizeMake(100, 100)]);
//        make.size.equalTo(CGSizeMake(100, 100));
        make.size.equalTo(100);
        make.right.equalTo(self.view).offset(-20);  //如果不指明参照物是父控件的哪边的时候则可以按照前边写的是哪边的来处理。例如如果前边写的是右侧则参照物也是父控件的右侧。
        make.top.equalTo(self.view).offset(20);
    }];
}

#pragma mark ————— 蓝色视图粘着父控件的右上角 间距是20 —————
-(void)test4
{
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];

    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(100);
        make.right.offset(-20);  //如果不写父控件的右边的话，则默认就是父控件的右边
        make.top.offset(20);
    }];
}

#pragma mark ————— 蓝色视图的宽高为父视图的一半 粘着父视图的右上角 间距是20 —————
-(void)test5
{
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.view).multipliedBy(0.5);
        make.right.equalTo(self.view).offset(-20);
        make.top.equalTo(self.view).offset(20);
    }];
}

#pragma mark ————— 蓝色视图的宽高为父视图的一半 水平和垂直居中 —————
-(void)test6
{
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.view).multipliedBy(0.5);
        make.center.equalTo(self.view);
    }];
}

#pragma mark ————— 蓝色视图的宽高为父视图的一半 水平和垂直居中 —————
-(void)text7
{
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    [blueView makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.width).multipliedBy(0.5);
        make.height.equalTo(self.view.height).multipliedBy(0.5);
        make.centerX.equalTo(self.view.centerX);
        make.centerY.equalTo(self.view.centerY);
    }];
}

#pragma mark ————— 蓝色视图的边缘与父视图的边缘有50的距离 —————
-(void)text8
{
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(50, 50, 50, 50));
    }];
}

#pragma mark ————— 蓝色视图和红色视图 —————
-(void)text9
{
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    CGFloat margin = 20;
    CGFloat height = 50;
    
    //给蓝色视图添加约束
    [blueView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.left).offset(margin);
        make.right.equalTo(redView.left).offset(-margin);
        make.bottom.equalTo(self.view.bottom).offset(-margin);
        make.height.equalTo(height);
        make.top.equalTo(redView.top);
        make.bottom.equalTo(redView.bottom);
        make.width.equalTo(redView.width);
    }];
    
    //给红色视图添加约束
    [redView makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.right).offset(-margin);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
