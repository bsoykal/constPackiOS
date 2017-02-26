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


#pragma mark Project
@interface Project :JSONModel
@property (nonatomic,assign) int projeId;
@property (nonatomic,retain) NSString *projeAdi;
@end


#pragma mark Error
@interface Error : NSObject
@property (nonatomic,assign) int errorId;
@property (nonatomic,retain) NSString *errorMsg;
- (void) initWithErrorId:(int) errorId withMessage:(NSString *)errorMsg;
@end
