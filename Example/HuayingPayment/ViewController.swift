//
//  ViewController.swift
//  HuayingPayment
//
//  Created by lzc1104 on 08/23/2017.
//  Copyright (c) 2017 lzc1104. All rights reserved.
//

import UIKit
import HuayingPayment
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /// 支付宝暂时不用注册账号 - 现在支付宝使用的是旧版本SDK -
        PaymentManagers.registerAccount(PaymentManagers.Account.alipay(appID: "???"))
        /// 微信必须注册账号
        PaymentManagers.registerAccount(PaymentManagers.Account.wechat(appID: "wxd5303f3621dd900d", appKey: "wechatpay"))
        
    }
    
    @IBAction func fuckpay(_ sender: Any) {
        
        //RESERVER 
        //此处的模板为 观赛日支付模板
        let req = PaymentManagers.AlipayRequest(urlString : "_input_charset=\"UTF-8\"&body=\"2|1|1|201709071401363968RGraWB|0.01|1\"&it_b_pay=\"1h\"&notify_url=\"http://61.143.225.69:9999/pay/alipay\"&out_trade_no=\"201709071401363968RGraWB\"&partner=\"2088901368278660\"&pay_method=\"directPay\"&payment_type=\"1\"&seller_id=\"2088901368278660\"&service=\"mobile.securitypay.pay\"&subject=\"购票（支付订金）\"&total_fee=\"0.01\"&sign_type=\"RSA\"&sign=\"0Ipq3RtX41QxnS0ZNMqvbF4BGIMmdH0m0y7TLOe%2F%2BAU3n0aiRsCSVHchk5pYF985mPyCr3QNAmDgg%2BsXb2%2FhKFOh9YoINnTpouLG7vZtSGjUSZnkz0EqO4ywlRiIuOdrQAesc598Q1EVk3UsVhG7LDzNfBFY70MRsE9qgJoz9RM%3D\"" ,scheme: "HuayingPayment")
        let order = PaymentManagers.Order.alipay(req: req)
        
        PaymentManagers.deliver(order, completionHandler: { result in
            switch result {
            case .success:
                debugPrint("FUCK YOU")
                break
            case .error(let error):
                switch error {
                case .cancel:
                    debugPrint("FUCK YOU CANCEL???")
                default:
                    debugPrint("FUCK ME")
                }
                break
            }
        })
    }
    
    @IBAction func weChatPay(_ sender: Any) {
        
        
        //RESERVER
        let req = PaymentManagers.WechatPayRequest(
            partnerId: "1387561902",
            prepayId: "wx20170907164305c6505ab5cf0070281493",
            nonceStr: "4kfi2fcbizn9p21z",
            timeStamp: 1504773802,
            package: "Sign=WXPay",
            sign: "3412E3F7B0870162777F2BC5A3865733"
        )
        let order = PaymentManagers.Order.weChat(req: req)
        
        PaymentManagers.deliver(order) { (result) in
            switch result {
            case .success:
                debugPrint("FUCK YOU")
                break
            case .error(let error):
                switch error {
                case .cancel:
                    debugPrint("FUCK YOU CANCEL???")
                default:
                    debugPrint("FUCK ME")
                }
                break
            }
        }
    }
    
}


