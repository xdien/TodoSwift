//
//  ImageNode.swift
//  Todo8
//
//  Created by xdien on 07/04/2023.
//
import AsyncDisplayKit

class ImageCellNode: TodoItems {
    
    let imageNode = ASNetworkImageNode()
    public let textNode = ASTextNode()
    init(data: TodoItemModel) {
        super.init()
        type = .image
//        imageNode.url  = URL(string: data.subtitleNode.value)
        textNode.attributedText = NSAttributedString(string: data.textNode.value)
        imageNode.backgroundColor = .brown
        self.addSubnode(imageNode)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        // Set the preferred size of the red node to be 5/6 of the screen width
        let insets = UIEdgeInsets(top: 10, left: 200, bottom: 10, right: 10)
        imageNode.style.preferredSize = CGSize(width: 200, height: 200)
        // Create a stack layout spec with horizontal direction
        let stakHorizonal = ASStackLayoutSpec(direction: .horizontal, spacing: 10, justifyContent: .start, alignItems: .baselineFirst, children: [imageNode])
        let stackH = ASInsetLayoutSpec(insets: insets, child: stakHorizonal)        // Return the stack spec as the layout spec for the parent node
        return stackH
    }
    
}
