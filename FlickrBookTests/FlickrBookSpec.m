#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMockito/OCMockito.h>


#import "MainViewController.h"


SpecBegin(MainViewController)

describe(@"MainViewController", ^{
    __block MainViewController *_mvc;
    beforeEach(^{
        _mvc = [[MainViewController alloc]init];
        UIView *view = _mvc.view;
        expect(view).toNot.beNil();
    });
    it(@"should have a tableview", ^{
        expect(_mvc.tableView).toNot.beNil();
    });
    it(@"s tableview's datasource should be class FRCDataSource", ^{
        expect(_mvc.tableView.dataSource.class).to.equal(FRCDataSource.class);
    });
});

SpecEnd