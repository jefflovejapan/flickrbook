#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMockito/OCMockito.h>


#import "MainViewController.h"


SpecBegin(MainViewController)

describe(@"MainViewController", ^{
    __block MainViewController *_mvc;
    beforeEach(^{
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
        UINavigationController *_navController = [sb instantiateViewControllerWithIdentifier:@"NavController"];
        _mvc = _navController.viewControllers[0];
        UIView *view = _mvc.view;
        expect(view).toNot.beNil();
    });

    it(@"should have a tableview", ^{
        expect(_mvc.tableView).toNot.beNil();
    });

    it(@"s tableview's datasource should be class FRCDataSource", ^{
        expect(_mvc.tableView.dataSource.class).to.equal(FRCDataSource.class);
    });

    it(@"should be in a navigation controller", ^{
        expect(_mvc.navigationController).toNot.beNil();
    });
    
    it(@"should have a Flickr API key", ^{
        expect(_mvc.flickrApiKey).toNot.beNil();
    });
    
    
});

SpecEnd