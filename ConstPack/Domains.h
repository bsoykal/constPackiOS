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

#pragma mark Error
@interface Error : NSObject
@property (nonatomic,assign) int errorId;
@property (nonatomic,retain) NSString *errorMsg;
- (void) initWithErrorId:(int) errorId withMessage:(NSString *)errorMsg;
@end

#pragma mark User
@interface User : JSONModel
@property (nonatomic,assign) int kullaniciId;
@property (nonatomic,retain) NSString *kullaniciAdi;
@property (nonatomic,retain) NSString *unvan;
@property (nonatomic,assign) int rolId;
@property (nonatomic,retain ) NSString *eposta;
@property (nonatomic,assign) BOOL durum;
@end

#pragma mark Project
@interface Project :JSONModel
@property (nonatomic,assign) int projeId;
@property (nonatomic,retain) NSString *projeAdi;
@end

#pragma mark Block
@interface Block :JSONModel
@property (nonatomic,assign) int blokId;
@property (nonatomic,assign) int projeId;
@property (nonatomic,retain) NSString *blokAdi;
@property (nonatomic,assign) BOOL durum;
@end

#pragma mark Floor
@interface Floor :JSONModel
@property (nonatomic,assign) int katid;
@property (nonatomic,assign) int blokId;
@property (nonatomic,retain) NSString *katAdi;
@property (nonatomic,assign) BOOL durum;
@end

#pragma mark Product
@interface Product :JSONModel
@property (nonatomic,assign) int urunId;
@property (nonatomic,assign) int katId;
@property (nonatomic,retain) NSString *urunAdi;
@property (nonatomic,assign) BOOL durum;
@end


