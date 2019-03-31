//
//  MNGifLoadingView.m
//  GifLoadingView
//
//  Created by AQ on 2019/3/31.
//

#import "MNGifLoadingView.h"
#import "UIImage+GIF.h"

@interface MNGifLoadingView ()

/** 用来存储图片 */
@property (nonatomic, strong) NSMutableDictionary *images;

@end

@implementation MNGifLoadingView

+ (MNGifLoadingView *)sharedView {
    
    static dispatch_once_t onceToken;
    static MNGifLoadingView *sharedView;
    dispatch_once(&onceToken, ^{
        sharedView = [[self alloc] init];
    });
    return sharedView;
}

- (NSMutableDictionary *)images {
    if (!_images) {
        _images = [[NSMutableDictionary alloc] init];
    }
    return _images;
}


+ (void)startLoadingWithGifImageName:(NSString *)imageName {
    
    [self startLoadingWithGifImageName:imageName andType:SVProgressHUDMaskTypeClear];
}

/**
 开始加载
 
 @param imageName 图片名称
 @param type 背景模式
 */
+ (void)startLoadingWithGifImageName:(NSString *)imageName andType:(SVProgressHUDMaskType)type {
    
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:@"gif"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:imagePath]) {
        [SVProgressHUD showWithStatus:@"您要加载的gif图片不存在"];
        [SVProgressHUD dismissWithDelay:2.0f];
    } else {
        MNGifLoadingView *shared = [MNGifLoadingView sharedView];
        BOOL isImageExit = [shared.images.allKeys containsObject:imageName];
        if (!isImageExit) {
            NSData *data = [NSData dataWithContentsOfFile:imagePath];
            UIImage *image = [UIImage sd_animatedGIFWithData:data];
            shared.images[imageName] = image;
        }
        UIImage *gifImage = shared.images[imageName];
        //    [SVProgressHUD setDefaultMaskType:type];
        [SVProgressHUD setMinimumDismissTimeInterval:10];
        [SVProgressHUD setBackgroundColor:[UIColor clearColor]];
        [SVProgressHUD setImageViewSize:CGSizeMake(44, 44)];
        [SVProgressHUD showImage:gifImage status:nil];
    }
}

+ (void)endLoading {
    [SVProgressHUD dismiss];
}


@end
