# simple-record

# はじめに
　日報記録アプリに週の振り返り、月の振り返り機能を持たせたい。
　シェアはしない。全て個人目的。
　各種連携はせずにひとまずはクリックポードへコピーがしたい。

# どんなことをやるか
## メイン画面
- 記録
- 閲覧
- 通知（これは後ほど）


## 必要な機能
- ログイン
- 日報投稿
- 一週間の目標登録
- 1ヶ月の目標登録（これはあとで）

「理想と現実の差異を常に認識し続ける」
　簡単に確認できるといい。
　PCだけじゃなくスマホからでも投稿

## やらないこと
　SNS連携・画像投稿

## ながれ
1. 日々日報を投稿
2. 1週間に一度(毎週土曜？)　振り返り+来週の目標設定をする。


## 振り返りをどうするか
　今週分の振り返りをしてなかったらなんか光る？　ボタンが大きくなる？
　そこらへんの細かいところはあとでいい。

　記載が重複しなければOK。

## MVCをつくる
　みにまむさくせすをするぞ。
　ログイン.ログアウト
  日報投稿
  　　日付　
        ジャンル　やったこと　時間
        ジャンル　やったこと　時間
        ジャンル　やったこと　時間
  　  感想
　　　日付が重複したらだめ

  振り返り
  　　先週の目標　できたかどうか
  　　振り返り
  　　来週の目標　3つ

  閲覧
  　　日報/振り返り