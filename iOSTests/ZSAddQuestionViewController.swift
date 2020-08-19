//
//  ZSAddQuestionViewController.swift
//  iOSTests
//
//  Created by vstarcam on 2020/7/31.
//  Copyright © 2020 sen. All rights reserved.
//

import UIKit

class ZSAddQuestionViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    var questionField: UITextField?
    var answerTextView: UITextView?
    var addBtn: UIButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.yellow
        self.loadSubViews()
    }
    
    func loadSubViews() {
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(endEdit))
        self.view.addGestureRecognizer(tap)
        
        questionField = UITextField(frame: CGRect(x: 30, y: 84, width: UIScreen.main.bounds.width - 60, height: 50))
        questionField?.textColor = UIColor.black
        questionField?.backgroundColor = UIColor.white
        questionField?.delegate = self
        self.view.addSubview(questionField!)
        
        answerTextView = UITextView(frame: CGRect(x: 30, y: 150, width:  UIScreen.main.bounds.width - 60, height: 350))
        answerTextView?.textColor = .black
        answerTextView?.backgroundColor = .white
        answerTextView?.delegate = self
        self.view.addSubview(answerTextView!)
        
        
        
//        UIButton(type: UIButton.ButtonType)
        addBtn = UIButton(type: .custom)
        addBtn!.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        addBtn!.backgroundColor = .clear
        addBtn!.setImage(UIImage(systemName: "arrow.down.doc"), for: .disabled)
        addBtn!.setImage(UIImage(systemName: "arrow.down.doc.fill"), for: .normal)
        addBtn!.addTarget(self, action: #selector(addQuestion), for: .touchUpInside)
//        addBtn!.isEnabled = false
//        self.view.addSubview(addBtn!)
        
//        let finishItem = UIBarButtonItem(image: UIImage(systemName: ""), style: .plain, target: self, action: #selector(addQuestion))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addBtn!)
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        
    }
    
    func checkQuestionAndAnswerContent() -> Void {
        if (answerTextView!.text != nil) && (questionField!.text != nil){
            if (answerTextView!.text!.count > 0) && (questionField!.text!.count > 0) {
                self.navigationItem.rightBarButtonItem?.isEnabled = true
            }
            else{
                self.navigationItem.rightBarButtonItem?.isEnabled = false
            }
        } else {
            self.navigationItem.rightBarButtonItem?.isEnabled = false
        }
    }
    
    @objc func endEdit() {
        self.view.endEditing(true)
    }
    
    @objc func addQuestion() {
        self.endEdit()
        
        let questionModel = ZSTableModel(modelType: .questionType, content: (self.questionField?.text!)!)
        let answerModel = ZSTableModel(modelType: .answerType, content: (self.answerTextView?.text)!)
        let addResult = ZSQuestionController.saveQuestion(question: questionModel, answer: answerModel)
        if addResult {
            questionField!.text = nil
            answerTextView!.text = nil
            self.checkQuestionAndAnswerContent()
            print("YES")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEdit()
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        self.checkQuestionAndAnswerContent()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.checkQuestionAndAnswerContent()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
