//
//  AddToDoItemViewController.m
//  ToDoList
//
//  Created by Parsa Dev on 2015-06-01.
//  Copyright (c) 2015 Parsa Alipour. All rights reserved.
//

#import "AddToDoItemViewController.h"
@interface AddToDoItemViewController()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;

@end


@implementation AddToDoItemViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.saveButton setAction:@selector(btnPressed:)];
    [self.cancelButton setAction:@selector(btnPressed:)];
    
}

-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

-(void)btnPressed: (id) sender{
    if (sender != self.saveButton) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
    if (self.textField.text.length > 0){
        self.toDoItem = [[ToDoItem alloc]init];
        self.toDoItem.itemName = self.textField.text;
        self.toDoItem.completed = NO;
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


@end
