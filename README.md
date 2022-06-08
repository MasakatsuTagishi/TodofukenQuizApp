# ios-todofukenflashcard
iOSアプリ「都道府県フラッシュカード」
## 概要
フラッシュカードをイメージして制作したゲームアプリです。
## アプリ仕様
https://user-images.githubusercontent.com/83049586/172505497-2777a4e3-d9f4-4408-b295-3afd5fa8f423.MP4
### 環境
- IDE : Xcode 13.4.1
- Swift : Swift 5.6.1
- 開発ターゲット : iOS 14.5
### ライブラリ
- Firebase : 8.7.0
- KeychainAccess : 4.2.2
### 使い方
1. 地域を選択します。
2. 選択した地域の都道府県の形の画像がランダムに表示されます。  
質 : 質問者は解答者を指名します。  
回 : 回答者は画像を見て都道府県名を答えます。  
質 : 質問者は回答が正解であれば○ボタンを不正解であれば×ボタンを押します。  
質 : 回答が終了したら「ランキングに登録」ボタンを押し、ランキングに登録します。
3. ランキングを表示する。  
正答率の順番にランキング表示がされます。
## 課題
- **ViewControllerにロジックがまじっているので、機能追加しづらい**  
Swiftを学習した頃から、本アプリの開発をはじめました。
ViewControllerに全てのロジックをかくことからスタートしました。  
リリースをしてから、学習した内容をもとに少しづつリファクタリングを行っています。  
少しづつ設計やclassを細かく分けることで保守しやすいコードに改善したいと考えています。

- **UI/UXについて**  
何人かにアプリを実際に使ってもらいましたが、使い方がわからないという意見をもらいました。  
ユーザーの操作を想像し、使いやすい画面に変更していく必要があると感じています。  

- **StoryboardにCell以外の全ての画面が収まっている**  
全てStoryboardに詰め込んでいます。  
コンフリクトの原因にもなるので、Xibファイルに分離をさせていきます。　　

- **git操作やブランチの運用について**  
アプリ開発途中からgit操作やブランチの運用をはじめました。  
本リポジトリーをgitの練習に使ってしまったので、見苦しい点があると思います。