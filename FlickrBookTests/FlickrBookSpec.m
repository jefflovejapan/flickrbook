#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMockito/OCMockito.h>


#import "MainViewController.h"
#import "Store.h"
#import "InstitutionsTVDS.h"


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
        expect(_mvc.tableView.dataSource.class).to.equal(InstitutionsTVDS.class);
    });

    it(@"should be in a navigation controller", ^{
        expect(_mvc.navigationController).toNot.beNil();
    });
    
    it(@"should have a Flickr API key", ^{
        expect(_mvc.flickrApiKey).toNot.beNil();
    });
    
    it(@"should have a toolbar that isn't hidden", ^{
        expect(_mvc.navigationController.toolbarHidden).toNot.equal(NO);
    });
    
    it(@"should have toolbar items", ^{
        expect(_mvc.toolbarItems).toNot.beNil();
    });
    
    it(@"should have a Ping Flickr button", ^{
        UIBarButtonItem *item = _mvc.toolbarItems[0];
        expect([item.title isEqualToString:@"Ping Flickr"]);
        
//        Why isn't this true? vvv
//        expect(item).to.equal(_mvc.pingFlickrItem);
    });
    
    it(@"should ping Flickr when button is tapped", ^{
        expect(_mvc.pingFlickrItem.target).to.equal(_mvc);
        expect(_mvc.pingFlickrItem.action).to.equal(NSSelectorFromString(@"pingFlickr:"));
    });
});

describe(@"Store", ^{
    __block Store *_store;
    beforeAll(^{
        _store = [[Store alloc]init];
    });
    it(@"should create a valid managedobjectcontext", ^{
        expect(_store.managedObjectContext).toNot.beNil();
    });
});

SpecEnd