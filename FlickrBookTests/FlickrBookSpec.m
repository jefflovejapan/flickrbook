#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMockito/OCMockito.h>


#import "MainViewController.h"


SpecBegin(MainViewController)

describe(@"starting up", ^{
    __block MainViewController *_mvc;
    beforeEach(^{
        _mvc = [[MainViewController alloc]init];
        UIView *view = _mvc.view;
        expect(view).toNot.beNil();
    });
    it(@"should have a tableview", ^{
        expect(_mvc.tableView).toNot.beNil();
    });
});

SpecEnd