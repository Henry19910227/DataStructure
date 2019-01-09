//
//  ViewController.swift
//  DataStructure
//
//  Created by 廖冠翰 on 2019/1/8.
//  Copyright © 2019 廖冠翰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let linkedList = LinkedList<Int>()
        
        linkedList.append(value: 10)
        linkedList.append(value: 20)
        linkedList.append(value: 30)
        linkedList.append(value: 40)
        linkedList.append(value: 50)
        
        print("最後一個節點值為 \(linkedList.last?.value ?? 0)")
        print("共有 \(linkedList.count) 個節點")
        print("\(linkedList.nodeAt(6)?.value ?? 0)")
        print(linkedList[8])
        
    }


}

