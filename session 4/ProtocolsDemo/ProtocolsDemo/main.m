//
//  main.m
//  ProtocolsDemo
//
//  Created by Vu Tran Lam on 3/15/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

//// main.m
//
//#import <Foundation/Foundation.h>
//#import "Bicycle.h"
//
//int main(int argc, const char * argv[])
//{
//    @autoreleasepool
//    {
//        Bicycle *bike = [[Bicycle alloc] init];
//        [bike startPedaling];
//        [bike signalLeftTurn];
//        [bike signalStop];
//        [bike lockToStructure:nil];
//    }
//    return 0;
//}

// main.m
#import <Foundation/Foundation.h>
#import "Bicycle.h"
#import "Car.h"
#import "StreetLegal.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        id <StreetLegal> mysteryVehicle = [[Car alloc] init];
        
        /*if ([mysteryVehicle conformsToProtocol:@protocol(StreetLegal)])
        {
            [mysteryVehicle signalStop];
            [mysteryVehicle signalLeftTurn];
            [mysteryVehicle signalRightTurn];
        }*/
        
        [mysteryVehicle signalLeftTurn];
        
        mysteryVehicle = [[Bicycle alloc] init];
        [mysteryVehicle signalLeftTurn];
    }
    return 0;
}
