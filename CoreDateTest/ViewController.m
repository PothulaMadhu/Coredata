//
//  ViewController.m
//  CoreDateTest
//
//  Created by Madhusudan Reddy on 31/05/18.
//  Copyright © 2018 BlackCurrant Apps LLP. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)saveContext {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSManagedObject *reason = [NSEntityDescription insertNewObjectForEntityForName:@"Reason" inManagedObjectContext:context];
    [reason setValue:@"" forKey:@"reason"];
    // Save the context
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Save Failed! %@ %@", error, [error localizedDescription]);
    }
}
-(void)delete {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSEntityDescription *productEntity=[NSEntityDescription entityForName:@"Refuel" inManagedObjectContext:context];
    NSFetchRequest *fetch=[[NSFetchRequest alloc] init];
    [fetch setEntity:productEntity];
    NSPredicate *p=[NSPredicate predicateWithFormat:@"odometer == %@",@""];
    [fetch setPredicate:p];
    NSError *fetchError;
    NSArray *fetchedProducts=[context executeFetchRequest:fetch error:&fetchError];
    
    for (NSManagedObject *product in fetchedProducts) {
        [context deleteObject:product];
    }
    [context save:nil];

}
-(void)replaceContext {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"Refuel"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"odometer == %@", @""];
    [fetchRequest setPredicate:predicate];
    NSArray *results = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
     NSManagedObject* favoritsGrabbed = [results objectAtIndex:0];
    [favoritsGrabbed setValue:@"" forKey:@"date"];
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Save Failed! %@ %@", error, [error localizedDescription]);
    }else {
    }
}

-(void)fetchContext {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@""];
    NSMutableArray *array = [[context executeFetchRequest:request error:nil] mutableCopy];
    NSManagedObject *object = [array objectAtIndex:1];
    [object valueForKey:@""];
    NSLog(@"%@",[object valueForKey:@""]);
}

-(NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}


@end
