//
//  UIImage+HXUIImage.m
//  TestDemo
//
//  Created by SS001 on 2021/4/30.
//

#import "UIImage+HXUIImage.h"

@implementation UIImage (HXUIImage)

+ (UIImage *)hx_imageWithName:(NSString *)name
{
    dispatch_semaphore_t signal = dispatch_semaphore_create(0);
        __block UIImage *img;
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            CGImageRef cgImage = [UIImage imageNamed:name].CGImage;
            
            CGImageAlphaInfo alphaInfo = CGImageGetAlphaInfo(cgImage) & kCGBitmapAlphaInfoMask;
            BOOL hasAlpha = NO;
            if (alphaInfo == kCGImageAlphaPremultipliedLast ||
                alphaInfo == kCGImageAlphaPremultipliedFirst ||
                alphaInfo == kCGImageAlphaLast ||
                alphaInfo == kCGImageAlphaFirst) {
                hasAlpha = YES;
            }
            
            // bitmapInfo
            CGBitmapInfo bitmapInfo = kCGBitmapByteOrder32Host;
            bitmapInfo |= hasAlpha ? kCGImageAlphaPremultipliedFirst : kCGImageAlphaNoneSkipFirst;
            
            // size
            size_t width = CGImageGetWidth(cgImage);
            size_t height = CGImageGetHeight(cgImage);
            
            // content
            CGContextRef content = CGBitmapContextCreate(NULL, width, height, 8, 0, CGColorSpaceCreateDeviceRGB(), bitmapInfo);
            
            // drew
            CGContextDrawImage(content, CGRectMake(0, 0, width, height), cgImage);
            
            // get cgImage
            cgImage = CGBitmapContextCreateImage(content);
            
            // into UIImage
            UIImage *newImage = [UIImage imageWithCGImage:cgImage];
            
            // release
            CGContextRelease(content);
            CGImageRelease(cgImage);
            
            img = newImage;
            dispatch_semaphore_signal(signal);
        });
        
        dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
        
        return img;
}

@end
