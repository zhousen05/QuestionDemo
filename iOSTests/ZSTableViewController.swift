//
//  ZSTableViewController.swift
//  iOSTests
//
//  Created by vstarcam on 2020/7/31.
//  Copyright © 2020 sen. All rights reserved.
//

import UIKit

class ZSTableViewController: UITableViewController {

    var dataArr: [ZSTableModel] = [ZSTableModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
//        initDataArr()
        
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "reuseIdentifier")
        self.tableView.separatorStyle = .none
        
        self.loadNavBarBtn()
        
    }
    
    func loadNavBarBtn() -> Void {
        
        let inportItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.down.on.square"), style: .plain, target: self, action: #selector(inportQuestions))
        
        let outPortItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up.on.square"), style: .plain, target: self, action: #selector(outportQuestions))
        
        self.navigationItem.leftBarButtonItems = [inportItem, outPortItem]
        
        let searchItem = UIBarButtonItem(image: UIImage(systemName: "doc.text.magnifyingglass"), style: .plain, target: self, action: #selector(searchQuestions))
        
        self.navigationItem.rightBarButtonItem = searchItem
    }
    
    @objc func inportQuestions() -> Void {
        
    }
    
    @objc func outportQuestions() -> Void {
        
    }
    
    @objc func searchQuestions() -> Void {
        
    }
    
    func initDataArr() {
        
/*
        for i in 0..<10 {
            let question = ZSTableModel(modelType: .questionType, content: String(format: "question%", arguments: [i]))
            let answer = ZSTableModel(modelType: .answerType, content: String(format: "answer%ddaedhwaiulhfaewgbfdywaekghduaewilfhuiaewblcawklelghdyewailhyddchnweladbhaweulkghdfwaeuhdaewuilkdfbaewkllfdhawo;eij'waehpguafeheu", arguments: [i]))
            let space = ZSTableModel(modelType: .answerType, content: "")
            dataArr.append(question)
            dataArr.append(answer)
            dataArr.append(space)
        }
        */
        ZSQuestionController.getAllQuestion { (questions:[ZSTableModel]) in
            self.dataArr = questions
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.initDataArr()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        let model: ZSTableModel = dataArr[indexPath.row]
        cell.textLabel?.text = model.content
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = model.font
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model: ZSTableModel = dataArr[indexPath.row]
        return model.cellHeight
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let model = self.dataArr[indexPath.row]
            ZSQuestionController.deleteQuestion(question: model) {
                DispatchQueue.main.async {
                    self.initDataArr()
                }
            }
            

            
            
            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
