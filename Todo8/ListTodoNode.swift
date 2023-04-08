//
//  ListTodoNode.swift
//  Todo8
//
//  Created by xdien on 07/04/2023.
//
import AsyncDisplayKit
import ReactiveSwift
import Foundation



// Create an array of Item objects using an array literal
var todoItems: [TodoItemModel] = [
    TodoItemModel(id: 1, textNode: "Item 1", subtitleNode: "Trong ví dụ này, chúng ta tạo ra một ASCellNode có tên là ImageGridCellNode. Trong hàm khởi tạo, chúng ta lưu trữ mảng các hình ảnh và đặt automaticallyManagesSubnodes thành true để Texture tự động quản lý các nút con của ImageGridCellNode", type: .text),
    TodoItemModel(id: 2, textNode: "Item 2", subtitleNode: "Subtitle 2", type: .text),
    TodoItemModel(id: 2, textNode: "Item 2", subtitleNode: "https://media2.giphy.com/media/SYtp0v8EKcRpEYfCb0/200.gif?cid=f0bdee709ejf89avzourz2r8wb6o584tf8z9he0w3w87jwma&rid=200.gif&ct=g", type: .image),
    TodoItemModel(id: 2, textNode: "Item 2", subtitleNode: "https://media3.giphy.com/media/393kszFi2PuCEopURN/200.gif?cid=f0bdee709ejf89avzourz2r8wb6o584tf8z9he0w3w87jwma&rid=200.gif&ct=g", type: .image),
    TodoItemModel(id: 2, textNode: "Item 2", subtitleNode: "https://media0.giphy.com/media/3oEjHBpypAwr6nqadi/200.gif?cid=f0bdee70lcv5r763pbxz0cvslbtflq5zbusp6hm0c879jle9&rid=200.gif&ct=g", type: .image),
    TodoItemModel(id: 2, textNode: "Item 2", subtitleNode: "https://media4.giphy.com/media/ieVLxP9D2iY8L28WxT/200.gif?cid=f0bdee70lcv5r763pbxz0cvslbtflq5zbusp6hm0c879jle9&rid=200.gif&ct=g", type: .image),
    TodoItemModel(id: 2, textNode: "Item 2", subtitleNode: "https://media3.giphy.com/media/cyhPM1WKz10MpCE9fE/200.gif?cid=f0bdee709ejf89avzourz2r8wb6o584tf8z9he0w3w87jwma&rid=200.gif&ct=g", type: .image),
    TodoItemModel(id: 2, textNode: "Item 2", subtitleNode: "https://media2.giphy.com/media/SYtp0v8EKcRpEYfCb0/200.gif?cid=f0bdee709ejf89avzourz2r8wb6o584tf8z9he0w3w87jwma&rid=200.gif&ct=g", type: .image),
    
]

func randomString (length: Int) -> String {
  let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  return String ((0..<length).map { _ in letters.randomElement ()! })
}

func randomNumber (n: Int, m: Int) -> Int {
  return Int.random (in: n...m)
}



class ListTodoNode: ASDKViewController<ASCollectionNode> {

    private var myData: [String] = []
    let button = ASButtonNode()
    override init() {
        let collectionNode = ASCollectionNode(collectionViewLayout: UICollectionViewFlowLayout())
        super.init(node: collectionNode)
        collectionNode.delegate = self
        collectionNode.dataSource = self
        
        var  preloadTuning  = ASRangeTuningParameters()
        preloadTuning.leadingBufferScreenfuls = 2
        preloadTuning.trailingBufferScreenfuls = 1
        collectionNode.setTuningParameters(preloadTuning, for: .preload)
        
        var  displayTuning  = ASRangeTuningParameters()
        displayTuning.leadingBufferScreenfuls = 1
        displayTuning.trailingBufferScreenfuls = 0.5
        collectionNode.setTuningParameters(displayTuning, for: .display)
        node.backgroundColor = .white
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Load data for collection view
        
        for i in 1...2000{
            let toDo = TodoItemModel(id: i+3, textNode: randomString(length: 3), subtitleNode: "https://media4.giphy.com/media/76m5c9wtvrPKL7enZy/200.gif?cid=f0bdee70kgieyf0erk3kaqpf3nepqhkptxyy0gnnpwzy4v7j&rid=200.gif&ct=g", type: .image)
            todoItems.append(toDo)
        }
    }
    @objc func showASDKVC() {
         let vc = ASDKViewController(node: ASDisplayNode())
         vc.node.backgroundColor = .green
         let nav = ASDKNavigationController(rootViewController: vc)
         self.present(nav, animated: true, completion: nil)
     }
    
    
}

extension ListTodoNode: ASCollectionDelegate, ASCollectionDataSource {

    func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
        return 1
    }

    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return todoItems.count
    }

    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        let item = todoItems[indexPath.row]
        let cellNodeBlock = { () -> ASCellNode in
            switch item.type.value {
            case .text:
                let cellNode = TextNode(item: item)
                return cellNode
                
            case .image:
                let cellNode = ImageCellNode(data: item)
                return cellNode
            }
        }
        
        return cellNodeBlock
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, didSelectItemAt indexPath: IndexPath) {
        let item = todoItems[indexPath.row]
    }
}

