# Visitor-Pattern-in-CollectionView!

## 訪問者模式介紹
[Visitor Pattern in Swift](https://glow-harmony-176.notion.site/Visitor-839050ce78f742c7a520716d77fe6b81)

## 需求
![截圖 2022-12-07 上午11 14 31](https://user-images.githubusercontent.com/36924807/206079696-5970b2f9-6d90-4223-9005-f1ddea345f44.png)

一個聊天室畫面，用 **Collection View** 實現，並且一則訊息由不同的區塊組成：

1. 日期
2. 用戶資訊
3. 回覆資訊
4. 訊息內容
5. 連結
6. 圖片
7. 表情符號

### 當我們在實現 **cellForRowAt** 時可能會這樣寫：
```swift
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    guard let sectionKind = viewModel.getSectionLayoutKind(section: indexPath.section) else { return UICollectionViewCell() }
    
    switch sectionKind {
        case .creatorInfo:
            // ...
        case .commentInfo:
            // ...
        case .content:
            // ...
        case .link:
            // ...
        case .photo:
            // ...
        case .emoji:
            // ...
        }
    }
}
```
若未來增加一個新的區塊，switch case只會越來越長...，並且所有邏輯都在vc上，

別忘了如果有需要的話，我們還需要針對每個cell定義layout、點擊行為等等


## Visitor Pattern 的解決方式
### 定義
Visitor模式把操作從資料結構中分離出來，並可以依據需要增加新的處理方法，不用修改原本的程式碼與資料結構，提高了程式的擴展性和靈活性。
### Visitor
```swift
protocol ChatRoomMessageVisitor {
    associatedtype T
    func visit(_ viewObject: CreateInfoViewObject) -> T?
    func visit(_ viewObject: CommentInfoViewObject) -> T?
    func visit(_ viewObject: ContentViewObject) ->T?
    func visit(_ viewObject: LinkViewObject) -> T?
    func visit(_ viewObject: PhotoViewObject) -> T?
    func visit(_ viewObject: EmojiViewObject) -> T?
    func visit(_ viewObject: DateViewObject) -> T?
}

struct ChatRoomMessageCellConfiguratorVisitor: ChatRoomMessageVisitor {

    let cell: UICollectionViewCell
    
    func visit(_ viewObject: CreateInfoViewObject) -> UICollectionViewCell? {
        guard let cell = cell as? ChatRoomCreateInfoCollectionViewCell else { return nil }
        // ...
        return cell
    }
    
    func visit(_ viewObject: CommentInfoViewObject) -> UICollectionViewCell? {
        guard let cell = cell as? CharRoomCommentInfoCollectionViewCell else { return nil }
        // ...
        return cell
    }
    
    // ...
}
```
### Visitable
```swift
protocol ChatRoomMessageVisitable {
    @discardableResult func accept<V: ChatRoomMessageVisitor>(visitor: V) -> V.T?
}
```
### ViewObject
```swift
struct ContentViewObject: ChatRoomMessageVisitable {
    let text: String
    
    func accept<V>(visitor: V) -> V.T? where V: ChatRoomMessageVisitor {
        return visitor.visit(self)
    }
}

struct LinkViewObject: ChatRoomMessageVisitable {
    let urlString: String
    
    func accept<V>(visitor: V) -> V.T? where V: ChatRoomMessageVisitor {
        return visitor.visit(self)
    }
}

// ...
```
### cellForItemAt
```swift
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    guard let visitable = viewModel.getVisitable(indexPath: indexPath),
          let cellType = visitable.accept(visitor: ChatRoomMessageCellVisitor()) else { return UICollectionViewCell() }
          
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath)
    visitable.accept(visitor: ChatRoomMessageCellConfiguratorVisitor(cell: cell))
    
    return cell
}
```

## 範例結果
![ezgif com-gif-maker](https://user-images.githubusercontent.com/36924807/206078492-c05c33aa-3fc1-4e71-b49e-331dc3bde76c.gif)
