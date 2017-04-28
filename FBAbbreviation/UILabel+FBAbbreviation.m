//
//  UILabel+FBAbbreviation.m
//  GCDDeno
//
//  Created by FBI on 17/4/28.
//  Copyright © 2017年 fengbing. All rights reserved.
//

#import "UILabel+FBAbbreviation.h"
#import <CoreText/CoreText.h>
@implementation UILabel (FBAbbreviation)
/**
 最后一行显示字符
 
 @param distance 与右侧的距离
 @param str 最后显示的字符
 */
-(void)setLineReakByTruncatingLastDistance:(float)distance andString:(NSString *)str
{
    if(self.numberOfLines<=0){
        
        return;
    }
    //行数
    NSArray *separatedLines=[self getSeparatedLinesFromLabel];
    
    NSMutableString *limitedText=[NSMutableString string];
    if(separatedLines.count>=self.numberOfLines){
        
        for(int i=0;i<self.numberOfLines;i++){
            if(self.numberOfLines-1==i){
                UILabel *lastLineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width-distance, MAXFLOAT)];
                lastLineLabel.text = separatedLines[self.numberOfLines - 1];
                
                NSArray *subSeparatedLines = [lastLineLabel getSeparatedLinesFromLabel];
                NSString *lastLineText = [subSeparatedLines firstObject];
                NSInteger lastLineTextCount = lastLineText.length;
                [limitedText appendString:[NSString stringWithFormat:@"%@%@",[lastLineText substringToIndex:lastLineTextCount],str]];
                
            }else
            {
                [limitedText appendString:separatedLines[i]];
                
            }
            
            
        }
    }
    self.text=limitedText;
    
}

#pragma mark 获得Label每行的文本字符串数组
-(NSArray *)getSeparatedLinesFromLabel{
    
    NSString *text=[self text];
    UIFont *font=[self font];
    CGRect rect=[self frame];
    
    //字体
    CTFontRef myfont=CTFontCreateWithName((__bridge CFStringRef)[font fontName], [font pointSize], NULL);
    NSMutableAttributedString *attStr=[[NSMutableAttributedString alloc]initWithString:text];
    [attStr addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id _Nonnull)(myfont) range:NSMakeRange(0, attStr.length)];
    CTFramesetterRef frameSetter=CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attStr);
    CGMutablePathRef path=CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0, 0, rect.size.width, 10000));
    
    CTFrameRef frame=CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    NSArray *lines=(__bridge NSArray *)CTFrameGetLines(frame);
    
    NSMutableArray *linesArray=[[NSMutableArray alloc]init];
    for(id line in lines){
        CTLineRef lineRef=(__bridge CTLineRef)line;
        CFRange lineRange=CTLineGetStringRange(lineRef);
        NSRange range=NSMakeRange(lineRange.location, lineRange.length);
        NSString *lineStr=[text substringWithRange:range];
        [linesArray addObject:lineStr];
        
        
    }
    return linesArray;
    
    
    
    
    
}

@end
