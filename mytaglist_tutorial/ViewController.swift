//
//  ViewController.swift
//  mytaglist_tutorial
//
//  Created by Jeff Jeong on 2020/10/28.
//

import UIKit
import TagListView

class ViewController: UIViewController, TagListViewDelegate {

    @IBOutlet var addTagBtn: UIButton!
    @IBOutlet var myTagListView: TagListView!
    @IBOutlet var userInputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myTagListView.delegate = self
        
        addTagBtn.addTarget(self, action: #selector(addTag), for: .touchUpInside)
    }
    
    
    @objc fileprivate func addTag(){
        print("ViewController - addTag() called")
        // 사용자의 입력값을 가져온다.
        let userInput = userInputTextField.text ?? ""
        
        // 값이 있다면 태그 추가
        if userInput.count > 1 {
            myTagListView.addTag(userInput)
            userInputTextField.text = nil
        } else {
            // 값이 없으면 경고창 띄우기
            let alert = UIAlertController(title: "내용을 입력해주세요!", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    
    //MARK: - TagListViewDelegate 메소드
    
    
    /// 태그를 눌렀을 때
    /// - Parameters:
    ///   - title: 태그의 타이틀
    ///   - tagView: 해당 태그뷰
    ///   - sender: 태그 리스트뷰
    func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
        print("ViewController - tagPressed() called / title: \(title)")
        // 해당 태그뷰의 트루 폴스 값을 토글 시켜줌
        tagView.isSelected.toggle()
    }
    
    /// 태그 삭제버튼이 클릭 되었을 때
    /// - Parameters:
    ///   - title: 태그의 타이틀
    ///   - tagView: 해당 태그뷰
    ///   - sender: 태그 리스트뷰
    func tagRemoveButtonPressed(_ title: String, tagView: TagView, sender: TagListView) {
        print("ViewController - tagRemoveButtonPressed() called / title: \(title)")
        sender.removeTagView(tagView)
    }
}


