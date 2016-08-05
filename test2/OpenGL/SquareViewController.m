//
//  SquareViewController.m
//  test2
//
//  第一部分：使用“ES2”创建一个“EAGLContext”实例。
//
//  第二部分：将“view”的context设置为这个“EAGLContext”实例的引用。并且设置颜色格式和深度格式。
//
//  第三部分：将此“EAGLContext”实例设置为OpenGL的“当前激活”的“Context”。这样，以后所有“GL”的指令均作用在这个“Context”上。随后，发送第一个“GL”指令：激活“深度检测”。
//
//  第四部分：创建一个GLK内置的“着色效果”，并给它提供一个光源，光的颜色为绿色。

//  Created by baidu on 16/7/27.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "SquareViewController.h"
#import <GLKit/GLKit.h>
@interface SquareViewController ()
@property(nonatomic,strong)EAGLContext *context;
@property(nonatomic,strong)GLKBaseEffect *effect;
@end

@implementation SquareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    GLfloat zuobiao[48]={
        // 下面坐标的意义
        //顶点X、顶点Y，顶点Z、法线X、法线Y、法线Z、纹理S、纹理T
        0.5f,0.5f,-0.9f,   0.0f,0.0f,1.0f,        1.0f,1.0f,
        -0.5f,0.5f,-0.9f,   0.0f,0.0f,1.0f,       0.0f,1.0f,
        0.5f,-0.5f,-0.9f,   0.0f,0.0f,1.0f,     1.0f,0.0f,
        0.5f,-0.5f,-0.9f,   0.0f,0.0f,1.0f,     1.0f,0.0f,
        -0.5f,0.5f,-0.9f,   0.0f,0.0f,1.0f,     0.0f,1.0f,
        -0.5f,-0.5f,-0.9f,  0.0f,0.0f,1.0f,     0.0f,0.0f
    };
    
    self.context=[[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES3];
    GLKView *view=(GLKView*)self.view;
    view.context=self.context;
    view.drawableColorFormat=GLKViewDrawableColorFormatRGBA8888;
    view.drawableDepthFormat=GLKViewDrawableMultisample4X;
    
    [EAGLContext setCurrentContext:self.context];
    glEnable(GL_DEPTH_TEST);
    
    self.effect=[[GLKBaseEffect alloc]init];
    self.effect.light0.enabled=GL_TRUE;
    self.effect.light0.diffuseColor=GLKVector4Make(0.0f,1.0f,0.0f,1.0f);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
