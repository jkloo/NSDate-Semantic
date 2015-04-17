//
//  JKRootViewController.m
//  NSDate-Semantic
//
//  Created by Jeff Kloosterman on 4/16/15.
//  Copyright (c) 2015 Jeff Kloosterman. All rights reserved.
//

#import "JKRootViewController.h"
#import "NSDate+Semantic.h"

@interface JKRootViewController ()
@property(weak, nonatomic) IBOutlet UITableView *tableView;

@property NSArray *cellTitles;
@property NSArray *cellDates;

@end

@implementation JKRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.cellTitles = @[
        @"Next Sunday",
        @"Next Monday",
        @"Next Tuesday",
        @"Next Wednesday",
        @"Next Thursday",
        @"Next Friday",
        @"Next Saturday",
        @"Next Sunday at 2:30",
        @"Next Monday at 2:30",
        @"Next Tuesday at 2:30",
        @"Next Wednesday at 2:30",
        @"Next Thursday at 2:30",
        @"Next Friday at 2:30",
        @"Next Saturday at 2:30",
        @"4 Weeks From Next Sunday",
        @"4 Weeks Next Monday",
        @"4 Weeks Next Tuesday",
        @"4 Weeks Next Wednesday",
        @"4 Weeks Next Thursday",
        @"4 Weeks Next Friday",
        @"4 Weeks Next Saturday",
        @"4 Weeks From Next Sunday at 14:25",
        @"4 Weeks Next Monday at 14:25",
        @"4 Weeks Next Tuesday at 14:25",
        @"4 Weeks Next Wednesday at 14:25",
        @"4 Weeks Next Thursday at 14:25",
        @"4 Weeks Next Friday at 14:25",
        @"4 Weeks Next Saturday at 14:25",
    ];
    self.cellDates = @[
        [NSDate dateWhichIsNext:@"Sunday"],
        [NSDate dateWhichIsNext:@"Monday"],
        [NSDate dateWhichIsNext:@"Tuesday"],
        [NSDate dateWhichIsNext:@"Wednesday"],
        [NSDate dateWhichIsNext:@"Thursday"],
        [NSDate dateWhichIsNext:@"Friday"],
        [NSDate dateWhichIsNext:@"Saturday"],
        [NSDate dateWhichIsNext:@"Sunday" At:@"2:30"],
        [NSDate dateWhichIsNext:@"Monday" At:@"2:30"],
        [NSDate dateWhichIsNext:@"Tuesday" At:@"2:30"],
        [NSDate dateWhichIsNext:@"Wednesday" At:@"2:30"],
        [NSDate dateWhichIsNext:@"Thursday" At:@"2:30"],
        [NSDate dateWhichIsNext:@"Friday" At:@"2:30"],
        [NSDate dateWhichIsNext:@"Saturday" At:@"2:30"],
        [NSDate dateWhichIs:4 WeeksFromNext:@"Sunday"],
        [NSDate dateWhichIs:4 WeeksFromNext:@"Monday"],
        [NSDate dateWhichIs:4 WeeksFromNext:@"Tuesday"],
        [NSDate dateWhichIs:4 WeeksFromNext:@"Wednesday"],
        [NSDate dateWhichIs:4 WeeksFromNext:@"Thursday"],
        [NSDate dateWhichIs:4 WeeksFromNext:@"Friday"],
        [NSDate dateWhichIs:4 WeeksFromNext:@"Saturday"],
        [NSDate dateWhichIs:4 WeeksFromNext:@"Sunday" At:@"14:25"],
        [NSDate dateWhichIs:4 WeeksFromNext:@"Monday" At:@"14:25"],
        [NSDate dateWhichIs:4 WeeksFromNext:@"Tuesday" At:@"14:25"],
        [NSDate dateWhichIs:4 WeeksFromNext:@"Wednesday" At:@"14:25"],
        [NSDate dateWhichIs:4 WeeksFromNext:@"Thursday" At:@"14:25"],
        [NSDate dateWhichIs:4 WeeksFromNext:@"Friday" At:@"14:25"],
        [NSDate dateWhichIs:4 WeeksFromNext:@"Saturday" At:@"14:25"],
    ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.cellTitles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ is %@", [self.cellTitles objectAtIndex:indexPath.row],
                                                     [self.cellDates objectAtIndex:indexPath.row]];

    return cell;
}

@end
