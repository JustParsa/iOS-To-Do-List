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

@end


@implementation AddToDoItemViewController

-(void)viewDidLoad{
    [super viewDidLoad];
}

-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if (sender != self.saveButton) return;
    
    if (self.textField.text.length > 0){
        self.toDoItem = [[ToDoItem alloc]init];
        self.toDoItem.itemName = self.textField.text;
        self.toDoItem.completed = NO;
        
    }
    
}


@end
