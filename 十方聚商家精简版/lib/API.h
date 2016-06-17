//
//  API.h
//  十方聚商家精简版
//
//  Created by YideNet on 16/5/10.
//  Copyright © 2016年 YideNet. All rights reserved.
//

#ifndef API_h
#define API_h
/**
 接口固定要传参数:mod=sellerapp  action  token(视情况)
 */
#define httpUrl [NSString stringWithFormat:@"http://www.shifangju.com/m/api.php"]

#define RequestToken  [[RequestSingleInstance shareRequestInstanse] token]

#define RequestSingleInstanceUserID [[RequestSingleInstance shareRequestInstanse] userID]

//商家登录接口 参数：username  password
#define Login(username,password) @{@"mod":@"sellerapp",@"action":@"login",\
@"username":username,@"password":password}\

//订单列表接口------type分为dinner/zhekou/order三种模式
#define orderlist(type,begintime) @{@"mod":@"sellerapp",@"action":@"orderlist",@"token":RequestToken,@"uid":RequestSingleInstanceUserID,\
@"type":type,@"begintime":begintime}\


/**
商家登录接口-----------------
http://www.shifangju.com/m/api.php?mod=sellerapp&action=login&username=123456&password=123456


商家登出接口-----------------
http://www.shifangju.com/m/api.php?mod=sellerapp&action=logout


订单列表接口------type分为dinner/zhekou/order三种模式------------------
http://www.shifangju.com/m/api.php?mod=sellerapp&action=orderlist&token=7572f34b69e859d7506bcb5c97c4ae2d&uid=45&type=dinner&begintime=2015-01-01

http://www.shifangju.com/m/api.php?mod=sellerapp&action=orderlist&token=7572f34b69e859d7506bcb5c97c4ae2d&uid=45&type=zhekou&begintime=2015-01-01

http://www.shifangju.com/m/api.php?mod=sellerapp&action=orderlist&token=7572f34b69e859d7506bcb5c97c4ae2d&uid=45&type=order&begintime=2015-01-01



订单详情接口-------根据订单号----------
http://www.shifangju.com/m/api.php?mod=sellerapp&action=orderdetail&token=d9333ee6c2c28e818abbed990815058a&uid=45&type=dinner&id=2015060913709

http://www.shifangju.com/m/api.php?mod=sellerapp&action=orderdetail&token=d9333ee6c2c28e818abbed990815058a&uid=45&type=zhekou&id=5015090816828

http://www.shifangju.com/m/api.php?mod=sellerapp&action=orderdetail&token=d9333ee6c2c28e818abbed990815058a&uid=45&type=order&id=2016032865613



商家信息接口-----------------
http://www.shifangju.com/m/api.php?mod=sellerapp&action=sellerinfo&token=2e6671fe2aaf84a7001088fca64dea2e&uid=45



回复信息接口-----------------
http://www.shifangju.com/m/api.php?mod=sellerapp&action=reviews&token=2e6671fe2aaf84a7001088fca64dea2e&uid=45&sid=9


交易确认扫描接口-----scan----分为两种
----zhekou--------id/totalprice/nocheap/useid/sid
----dinner--------dinnerid/uid
http://www.shifangju.com/m/api.php?mod=sellerapp&action=scan&token=eeec9ad3ad7a2eaa892604484440363e&uid=45&dinnerid=2015060913709



优惠券核对接口-----ticketcheck----需要num优惠编号--------
http://www.shifangju.com/m/api.php?mod=sellerapp&action=ticketcheck&token=eeec9ad3ad7a2eaa892604484440363e&uid=45&number=xxxxxxx



优惠券搜索接口-----ticketsearch------------
http://www.shifangju.com/m/api.php?mod=sellerapp&action=ticketsearch&token=eeec9ad3ad7a2eaa892604484440363e&uid=45&number=xxxxxxx



评论回复接口-----commentreply------------
http://www.shifangju.com/m/api.php?mod=sellerapp&action=commentreply&token=eeec9ad3ad7a2eaa892604484440363e&uid=45&id=2015060913709
 
 */

#endif /* API_h */
