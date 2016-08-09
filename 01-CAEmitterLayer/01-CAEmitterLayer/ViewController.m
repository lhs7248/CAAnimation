//
//  ViewController.m
//  01-CAEmitterLayer
//
//  Created by lhs7248 on 16/8/9.
//  Copyright © 2016年 lhs7248. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (nonatomic,strong) CAEmitterLayer *emitter;

@property (nonatomic,strong) CAEmitterCell * particle;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)setUp{
    self.emitter = [[CAEmitterLayer alloc]init];;
    
    
    
    self.emitter.emitterMode = kCAEmitterLayerOutline;
    self.emitter.emitterShape = kCAEmitterLayerSphere;
    self.emitter.renderMode = kCAEmitterLayerUnordered;
    //    self.emitter.birthRate = 1;
    //    self.emitter.lifetime = 1;
    self.emitter.preservesDepth = true;
    
    [self.view.layer addSublayer:self.emitter];
    
    self.particle = [[CAEmitterCell alloc]init];
    self.particle.contents = (__bridge id _Nullable)([UIImage imageNamed:@"smoke"].CGImage);
    self.particle.birthRate = 10;
//    self.particle.color = [UIColor redColor].CGColor;
    self.particle.lifetime = 50;
    self.particle.lifetimeRange = 5;
    
    self.particle.velocity = 20;
    self.particle.velocityRange = 10;
    
    self.particle.scale = 0.02;
    self.particle.scaleRange = 0.1;
    self.particle.scaleSpeed = 0.02;
    
    
    
    self.emitter.emitterCells = @[self.particle];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
