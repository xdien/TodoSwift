//
//  AnyController.swift
//  Todo8
//
//  Created by xdien on 08/04/2023.
//

import Foundation
import AsyncDisplayKit
class AnyController: ASDKViewController<ASDisplayNode>{
    let button = ASButtonNode()
    let asDisplayNode = ASDisplayNode()
    override init() {
        super.init(node: asDisplayNode)
        node.backgroundColor = .gray
//                button.setTitle("Show ASDKViewController", with: .systemFont(ofSize: 18), with: .blue, for: .normal)
//        //        button.addTarget(self, action: #selector(showASDKVC), forControlEvents: .touchUpInside)
//                button.style.preferredSize = CGSize(width: 200, height: 50)
//                button.style.layoutPosition = CGPoint(x: 20, y: 200)
//
//                node.addSubnode(button)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.node.backgroundColor = .brown
        button.setTitle("Show ASDKViewController", with: .systemFont(ofSize: 18), with: .blue, for: .normal)
//        button.addTarget(self, action: #selector(showASDKVC), forControlEvents: .touchUpInside)
        button.style.preferredSize = CGSize(width: 200, height: 50)
        button.style.layoutPosition = CGPoint(x: 20, y: 200)
        

        self.view.addSubview(button.view)
    }

}

