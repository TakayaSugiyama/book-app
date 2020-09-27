//
//  SignupController.swift
//  book-app
//
//  Created by 杉山貴哉 on 2020/09/27.
//  Copyright © 2020 TakayaSugiyama. All rights reserved.
//

import UIKit
import Eureka

class SignupController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "新規登録"
        form +++ Section()
            <<< TextRow(){
                $0.title = "名前"
                $0.placeholder = "3文字以上15文字以内"
                $0.add(rule: RuleRequired())
                $0.add(rule: RuleMinLength(minLength: 3))
                $0.add(rule: RuleMaxLength(maxLength: 15))
                $0.validationOptions = .validatesOnBlur
            }.cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                    var errors = ""

                    for error in row.validationErrors {
                        let errorString = error.msg + "\n"
                        errors = errors + errorString
                    }
                    print(errors)
                }
            }
            <<< EmailRow(){
                $0.title = "メールアドレス"
                $0.add(rule: RuleEmail())
                $0.add(rule: RuleRequired())
            }.cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                    var errors = ""

                    for error in row.validationErrors {
                        let errorString = error.msg + "\n"
                        errors = errors + errorString
                    }
                    print(errors)
                }
            }
            <<< PasswordRow(){
                $0.title = "パスワード"
                $0.add(rule: RuleRequired())
                $0.add(rule: RuleMinLength(minLength: 6))
                $0.add(rule: RuleMaxLength(maxLength: 12))
                $0.placeholder = "6文字以上15文字以内"
            }.cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                    var errors = ""

                    for error in row.validationErrors {
                        let errorString = error.msg + "\n"
                        errors = errors + errorString
                    }
                    print(errors)
                }
            }
            +++ Section()
            <<< ButtonRow(){ row in
                row.title = "アカウントを作成する"
            }.onCellSelection { cell, row in
                print(row.section?.form?.validate().count  == 0)
            }
           <<< ButtonRow(){ row in
                row.title = "既にアカウント作成済みの方はこちら"
           }
        // Do any additional setup after loading the view.
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
