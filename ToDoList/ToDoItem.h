//
//  ToDoItem.h
//  ToDoList
//
//  Created by Parsa Dev on 2015-06-01.
//  Copyright (c) 2015 Parsa Alipour. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSString *creationDate;

@end
