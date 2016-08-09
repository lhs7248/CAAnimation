//
//  emiterView.m
//  CAEmitterTimer
//
//  Created by lhs7248 on 16/8/9.
//  Copyright © 2016年 lhs7248. All rights reserved.
//

#import "emiterView.h"


@interface emiterView()


@property (nonatomic,strong) CAEmitterLayer *emitter;

@property (nonatomic,strong) CAEmitterCell * particle;

@end
@implementation emiterView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(Class)layerClass{
    NSLog(@"%@",[CAEmitterLayer class]);
    return [CAEmitterLayer class];
    
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUp];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    self =  [super initWithFrame:frame];
    
    if (self) {
        
        [self setUp];
    }
    return self;
    
    
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self =  [super initWithCoder:aDecoder];
    
    if (self) {
        
        [self setUp];
    }
    return self;
    
    
}

-(void)setUp{
    
    self.emitter.emitterMode = kCAEmitterLayerOutline;
    self.emitter.emitterShape = kCAEmitterLayerSphere;
    self.emitter.renderMode = kCAEmitterLayerOldestFirst;
    self.emitter.preservesDepth = true;
    
    
    
    self.particle = [[CAEmitterCell alloc]init];
    self.particle.contents = (__bridge id _Nullable)([UIImage imageNamed:@"spark"].CGImage);
    self.particle.birthRate = 10;
    
    self.particle.lifetime = 50;
    self.particle.lifetimeRange = 5;
    
    self.particle.velocity = 20;
    self.particle.velocityRange = 10;
    
    self.particle.scale = 0.02;
    self.particle.scaleRange = 0.1;
    self.particle.scaleSpeed = 0.02;
    
    
    
    self.emitter.emitterCells = @[self.particle];
    
}

-(CAEmitterLayer *)emitter{
    if (_emitter == nil) {
        _emitter = (CAEmitterLayer * )self.layer;
    }
    
    return _emitter;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.emitter.emitterPosition = self.center;
    self.emitter.emitterSize = self.bounds.size;
    
}
@end
