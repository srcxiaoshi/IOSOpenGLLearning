//
//  FileHelper.h
//  KissGirl
//  
//  Created by shituanwei@baidu.com on 12-8-9.
//  Copyright (c) 2012年 Appublisher. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileHelper : NSObject


+ ( NSString * ) getAppRootPath;
+ ( NSString * ) getDocumentPath;
+ ( NSString * ) getCachePath;
+ ( NSString *) getLibraryPath;
+ ( NSString * ) getPreferencePath;

+ (BOOL) createFolderByPath:(NSString*) folderPath;
+ (BOOL) isFolderExistByPath:(NSString*) folderPath;
+ (BOOL) deleteFolderByPath:(NSString*) folderPath;

+ (BOOL) createFileByPath:(NSString*) filePath;
+ (BOOL) createFileByPathWithData:(NSString*) filePath filedata:(NSData*) nsdata;
+ (BOOL) isFileExistByPath:(NSString*) filePath;
+ (BOOL) deleteFileByPath:(NSString*) filePath;
+ (NSDictionary*) getFileAttribution:(NSString*)filePath;

+ (float)getFoldSize:(NSString *)foldstring;
+ (BOOL)removeFolder:(NSString *)foldstring;
@end