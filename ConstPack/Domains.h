//
//  Header.h
//  ConstPack
//
//  Created by Burak Soykal on 24/02/2017.
//  Copyright © 2017 Bartu Kusculuoglu. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface Domains : NSObject
@end

#pragma mark User

@interface User : JSONModel

@property (nonatomic,assign) int kullaniciId;
@property (nonatomic,retain) NSString *kullaniciAdi;
@property (nonatomic,retain) NSString *unvan;
@property (nonatomic,assign) int rollId;
@property (nonatomic,retain ) NSString *eposta;
@property (nonatomic,assign) BOOL durum;

@end
