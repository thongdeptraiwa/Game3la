//
//  ViewController.swift
//  3la
//
//  Created by MacOS on 23/01/2023.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var lbdiemban: UILabel!
    @IBOutlet weak var lbdiemmay: UILabel!
    @IBOutlet weak var lbkq: UILabel!
    @IBOutlet weak var bt2: UIButton!
    @IBOutlet weak var bt1: UIButton!
    @IBOutlet weak var ban3: UIImageView!
    @IBOutlet weak var ban2: UIImageView!
    @IBOutlet weak var ban1: UIImageView!
    @IBOutlet weak var may3: UIImageView!
    @IBOutlet weak var may2: UIImageView!
    @IBOutlet weak var may1: UIImageView!
    
    //var may1:Int = Int.random(in: 1...13)
    //var rd = Array(1...13)
    var rd:Array<Int> = [11,12,13,14,21,22,23,24,31,32,33,34,41,42,43,44,51,52,53,54,61,62,63,64,71,72,73,74,81,82,83,84,91,92,93,94,101,102,103,104,111,112,113,114,121,122,123,124,131,132,133,134]
    var bacaomay = 0
    var bacaoban = 0
    var diemmay1 = 0
    var diemmay2 = 0
    var diemmay3 = 0
    var diemban1 = 0
    var diemban2 = 0
    var diemban3 = 0
    
    
    func doi( n: Int,m:inout Int,d:inout Int ) -> Int {
        d = n
        d = d / 10
        if( d == 11 || d==12 || d==13 ){
             d = 10
            m = m + 1
        }
        
        return d
    }
    func diemtong(a: Int,b: Int,c: Int) -> Int {
        let tong = ( a + b + c ) % 10
        return tong
    }
    var n1 = 0
    @IBAction func bt1_action(_ sender: Any) {
        // ép kiểu int thành string
        n1 = n1 + 1
        if(may1.image==UIImage(named: rd[0].description)){
            n1=0
            return
        }
        if(n1>0){
            ban1.image = UIImage(named: rd[3].description)
        }
        if(n1>1 && ban1.image == UIImage(named: rd[3].description)){
            ban2.image = UIImage(named: rd[4].description)
        }
        if(n1>2){
            ban3.image = UIImage(named: rd[5].description)
            bt2.titleLabel!.text = "Xếp bài"
            n1=0
            return
        }
        
        
    }
    var n2 = 0
    @IBAction func bt2_action(_ sender: Any) {
//        if(ban3.image == UIImage(named: rd[5].description)){
            n2 = n2 + 1
            if((n2==1) && (ban3.image == UIImage(named: rd[5].description))){
                may1.image = UIImage(named: rd[0].description)
                may2.image = UIImage(named: rd[1].description)
                may3.image = UIImage(named: rd[2].description)
                let diemtongmay = diemtong(a: doi(n: rd[0],m: &bacaomay,d: &diemmay1), b: doi(n: rd[1],m: &bacaomay,d: &diemmay2), c: doi(n: rd[2],m: &bacaomay,d: &diemmay3))
                let diemtongban = diemtong(a: doi(n: rd[3],m: &bacaoban,d: &diemban1), b: doi(n: rd[4],m: &bacaoban,d: &diemban2), c: doi(n: rd[5],m: &bacaoban,d: &diemban3))
                if(bacaoban==3 || bacaomay==3){
                    if(bacaomay==3 && bacaoban==3){
                        lbkq.text = "Hòa"
                        lbdiemmay.text = "⭐️Ba Cao⭐️"
                        lbdiemban.text = "⭐️Ba Cao⭐️"
                    }
                    if(bacaoban==3){
                        lbkq.text = "😃Thắng😃"
                        lbdiemmay.text = "\(diemtongmay) Nút"
                        lbdiemban.text = "⭐️Ba Cao⭐️"
                    }
                    else{
                        lbkq.text = "☹️Thua☹️"
                        lbdiemmay.text = "⭐️Ba Cao⭐️"
                        lbdiemban.text = "\(diemtongban) Nút"
                    }
                    bacaomay=0
                    bacaoban=0
                }
                else{
                    if(diemtongban < diemtongmay){
                        lbkq.text = "☹️Thua☹️"
                        lbdiemmay.text = "\(diemtongmay) Nút"
                        lbdiemban.text = "\(diemtongban) Nút"
                    }
                    if(diemtongban > diemtongmay){
                        lbkq.text = "😃Thắng😃"
                        lbdiemmay.text = "\(diemtongmay) Nút"
                        lbdiemban.text = "\(diemtongban) Nút"
                    }
                    if(diemtongban == diemtongmay){
                        lbkq.text = "Hòa"
                        lbdiemmay.text = "\(diemtongmay) Nút"
                        lbdiemban.text = "\(diemtongban) Nút"
                    }
                    bacaomay=0
                    bacaoban=0
                    
                }

            }
            
            if(n2>1){
                may1.image = UIImage(named: "lungbai")
                may2.image = UIImage(named: "lungbai")
                may3.image = UIImage(named: "lungbai")
                ban1.image = UIImage(named: "lungbai")
                ban2.image = UIImage(named: "lungbai")
                ban3.image = UIImage(named: "lungbai")
                lbdiemmay.text = ""
                lbdiemban.text = ""
                lbkq.text = "Game Bài Cào"
                n2=0
                rd.shuffle()
                print(rd)
                return
            }
            
//        }
        
        
    }
    
    
    
    @IBAction func thoat(_ sender: Any) {
        let thongbao:UIAlertController = UIAlertController(title: "Thông Báo", message: "Bạn có chắc muốn thoát?", preferredStyle: UIAlertController.Style.alert)
        let btn_co:UIAlertAction = UIAlertAction(title: "Có", style: UIAlertAction.Style.cancel) { btn in
            exit(0)
        }
        let btn_ko:UIAlertAction = UIAlertAction(title: "Không", style: UIAlertAction.Style.default, handler: nil)
        thongbao.addAction(btn_co)
        thongbao.addAction(btn_ko)
        present(thongbao, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

      //lbchinh.text = "\(may1.description)"
        // xáo trộn mảng rd
        bt2.titleLabel!.text = "Xét bài"
        rd.shuffle()
        print(rd)
        print(rd.count)
        
        
//        print(rd)
//        print("tong \(diem(a: rd[0], b: rd[1], c: rd[2]))")
        
    }


}

