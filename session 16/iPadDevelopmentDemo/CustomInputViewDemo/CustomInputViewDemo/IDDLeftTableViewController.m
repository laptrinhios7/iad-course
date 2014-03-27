//
//  IDDLeftTableViewController.m
//  iPadDevelopmentDemo
//
//  Created by Vu Tran Lam on 12/14/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "IDDLeftTableViewController.h"
#import "IDDMonster.h"
#import "IDDWeapon.h"


@implementation IDDLeftTableViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        //Initialize the array of monsters for display.
        _monsters = [NSMutableArray array];
        
        //Create monster objects then add them to the array.
        [_monsters addObject:[IDDMonster newMonsterWithName:@"Cat-Bot" description:@"MEE-OW" icon:@"meetcatbot.png" weapon:[IDDWeapon newWeaponOfType:Sword]]];
        [_monsters addObject:[IDDMonster newMonsterWithName:@"Dog-Bot" description:@"BOW-WOW" icon:@"meetdogbot.png" weapon:[IDDWeapon newWeaponOfType:Blowgun]]];
        [_monsters addObject:[IDDMonster newMonsterWithName:@"Explode-Bot" description:@"Tick, tick, BOOM!" icon:@"meetexplodebot.png" weapon:[IDDWeapon newWeaponOfType:Fire]]];
        [_monsters addObject:[IDDMonster newMonsterWithName:@"Fire-Bot" description:@"Will Make You Steamed" icon:@"meetfirebot.png" weapon:[IDDWeapon newWeaponOfType:Smoke]]];
        [_monsters addObject:[IDDMonster newMonsterWithName:@"Ice-Bot" description:@"Has A Chilling Effect" icon:@"meeticebot.png" weapon:[IDDWeapon newWeaponOfType:Sword]]];
        [_monsters addObject:[IDDMonster newMonsterWithName:@"Mini-Tomato-Bot" description:@"Extremely Handsome" icon:@"meetminitomatobot.png" weapon:[IDDWeapon newWeaponOfType:NinjaStar]]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_monsters count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    IDDMonster *monster = _monsters[indexPath.row];
    cell.textLabel.text = monster.name;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    IDDMonster *selectedMonster = [_monsters objectAtIndex:indexPath.row];
    if (_delegate)
    {
        [_delegate selectedMonster:selectedMonster];
    }
}


@end
