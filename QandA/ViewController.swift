//
//  ViewController.swift
//  QandA
//
//  Created by Frank on 2017/4/29.
//  Copyright © 2017年 frankc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numberOfQ: UILabel!
    @IBOutlet weak var titleOfQ: UILabel!
    @IBOutlet weak var answerOfQ: UILabel!
    @IBOutlet weak var backgroundView: UIImageView!
    
    //  取得螢幕尺寸大小
    var fullSize:CGSize = UIScreen.main.bounds.size
    
    var qnaArray:[question] = [];       //  儲存問題和答案的陣列
    var count = 1;                      //  題號計數器
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ratioWidth = fullSize.width * (200/375)
        let ratioHeight = fullSize.height * (100/667)

        // create frame
        let numberFrame = CGRect(x: 31, y: 60, width: ratioWidth, height: ratioHeight)
        let titleFrame = CGRect(x: fullSize.width - ratioWidth - 31, y: fullSize.height * 0.5 - (ratioHeight/2), width: ratioWidth, height: ratioHeight)
        let answerFrame = CGRect(x: 31, y: fullSize.height - ratioHeight - 40, width: ratioWidth, height: ratioHeight)
        // create view
        let dialogBox1 = UIView(frame: numberFrame)
        let dialogBox2 = UIView(frame: titleFrame)
        let dialogBox3 = UIView(frame: answerFrame)
        
        // setting dialogBox property
        dialogBox1.backgroundColor = UIColor.lightGray
        dialogBox1.alpha = 0.7
        dialogBox1.layer.cornerRadius = 25
        
        dialogBox2.backgroundColor = UIColor.lightGray
        dialogBox2.alpha = 0.7
        dialogBox2.layer.cornerRadius = 25
        
        dialogBox3.backgroundColor = UIColor.lightGray
        dialogBox3.alpha = 0.7
        dialogBox3.layer.cornerRadius = 25
        
        // add view to superview
        backgroundView.addSubview(dialogBox1)
        backgroundView.addSubview(dialogBox2)
        backgroundView.addSubview(dialogBox3)

        // add questions into array
        qnaArray = [question(qTitle: "李白是哪一個朝代的人？", qAnswer: "唐朝"),
                    question(qTitle: "蘇軾是那一個朝代的詩人？", qAnswer: "宋朝"),
                    question(qTitle: "月亮代表人體的哪個器官？", qAnswer: "心 (月亮代表我的心)"),
                    question(qTitle: "阿姆斯壯在西元幾年登陸月球？", qAnswer: "1969"),
                    question(qTitle: "阿姆斯壯登陸月球時，搭乘的太空船是阿波羅幾號？", qAnswer: "11")]
        
        numberOfQ.text = "Question \(count)"
        titleOfQ.text = qnaArray[0].qTitle
        
    }
    
    @IBAction func popAnswer(_ sender: UIButton) {
        // set answer
        answerOfQ.text = qnaArray[count-1].qAnswer
    }
    
    @IBAction func gotoNextQ(_ sender: UIButton) {
        count += 1
        
        // avoid index out of array
        if (count > qnaArray.count) {
            count = 1;
        }
        
        answerOfQ.text = ""
        numberOfQ.text = "Question \(count)"
        titleOfQ.text = qnaArray[count-1].qTitle
    }

}

