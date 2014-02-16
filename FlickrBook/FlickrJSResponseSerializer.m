//
//  FlickrJSResponseSerializer.m
//  FlickrBook
//
//  Created by Blagdon Jeffrey on 2/16/14.
//  Copyright (c) 2014 Jeffrey Blagdon. All rights reserved.
//

#import "FlickrJSResponseSerializer.h"

@implementation FlickrJSResponseSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing *)error
{
    NSString *respString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];

//    To remove the "jsonFlickrApi(...)" wrapper (e.g., http://www.flickr.com/services/rest/?method=flickr.test.echo&format=json&api_key=eee64cbd3ad05b3a8cfd5e1fb3dc1caf) :

    respString = [respString substringFromIndex:14];
    respString = [respString substringToIndex:[respString length] - 1];
    NSData *respData = [respString dataUsingEncoding:NSUTF8StringEncoding];
    return [super responseObjectForResponse:response data:respData error:error];
}


@end
