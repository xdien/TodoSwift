//
//  ItemNode.swift
//  Todo8
//
//  Created by xdien on 07/04/2023.
//

import AsyncDisplayKit

class TodoItems : ASCellNode {
    var type: TodoType
    let leftMargin = CGFloat(100)
    override init() {
        type = .text
        super.init()
    }
}
