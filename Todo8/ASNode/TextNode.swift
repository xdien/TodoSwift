//
//  TextNode.swift
//  Todo8
//
//  Created by xdien on 07/04/2023.
//
import AsyncDisplayKit
import ReactiveSwift
import ReactiveCocoa

class TextNode: TodoItems {
    public let textNode = ASEditableTextNode()
    let deleteButton = ASButtonNode()
    
    let subtitleNode = ASEditableTextNode() // create a new text node for the subtitle
    
    let avatarIcon = ASImageNode()
    let mItem: TodoItemModel
    init(item: TodoItemModel) {
        mItem = item
        super.init()
        type = .text
        avatarIcon.image = UIImage(named: "aaaaa")
        avatarIcon.style.preferredSize = CGSize( width: 32, height: 32)
        subtitleNode.backgroundColor = .darkGray
        deleteButton.setTitle("Delete", with: nil, with: .red, for: .normal)
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), forControlEvents: .touchUpInside)
        subtitleNode.reactive.giaTri <~ item.textNode
        self.addSubnode(deleteButton)
        self.addSubnode(subtitleNode)
        self.addSubnode(textNode)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let iconInset = UIEdgeInsets(top: 10, left: 200, bottom: 10, right: 10)
        let rightInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 10)
        let buttonInset = UIEdgeInsets(top: 30, left: 30, bottom: 10, right: 200)
        let avatar = ASInsetLayoutSpec(insets: iconInset, child: avatarIcon)
        let textInset = ASInsetLayoutSpec(insets: rightInsets, child: subtitleNode)
        subtitleNode.style.maxWidth = ASDimension(unit: .points, value: constrainedSize.max.width - leftMargin)
        subtitleNode.style.minSize = CGSize(width: 50, height: 15)
        let btnInset = ASInsetLayoutSpec(insets: buttonInset, child: deleteButton)
        let horizontalStack = ASStackLayoutSpec(direction: .horizontal, spacing: 0, justifyContent: .start, alignItems: .start, children: [avatar, textInset,btnInset])
        return horizontalStack
    }
    
    @objc func deleteButtonTapped() {
        print("click ne ", textNode.attributedText?.string)
        let tt = TodoItemModel(id: 2, textNode: "changed", subtitleNode: "sub changed", type: .image)
        mItem.changeValue.apply(tt).start()
    }
}
