//
//  ToDoListTableViewController.m
//  ToDoList
//
//  Created by Parsa Dev on 2015-06-01.
//  Copyright (c) 2015 Parsa Alipour. All rights reserved.
//

#import "ToDoListTableViewController.h"
#import "ToDoItem.h"
#import "AddToDoItemViewController.h"

@implementation ToDoListTableViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.toDoItems = [[NSMutableArray alloc]init];
    [self loadInitialData];
    
}

-(IBAction)unwindToDoList:(UIStoryboardSegue *)segue{
    AddToDoItemViewController *source = [segue sourceViewController];
    if (source.toDoItem != nil){
        ToDoItem *item = source.toDoItem;
        [self.toDoItems addObject:item];
        [self.tableView reloadData];
    }
}

-(void)loadInitialData{
    for (int i = 0; i < 3; i++){
        ToDoItem *item = [[ToDoItem alloc]init];
        item.itemName = [@"Item numero " stringByAppendingString:[@(i) stringValue]];
        [self.toDoItems addObject:item];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.toDoItems count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    ToDoItem *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = toDoItem.itemName;
    
    if (toDoItem.completed){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}


#pragma mark - Table view delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    ToDoItem *tappedItem = [self.toDoItems objectAtIndex:indexPath.row];
    tappedItem.completed = !tappedItem.completed;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
}


@end
