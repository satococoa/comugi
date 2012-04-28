## Comugi

第2回 #p4dhack の @satococoa & @coddledegg ペアの作品です。


## 動かし方

```
$ cd comugi
$ bundle install --path vendor/bundle
$ rake db:migrate
$ rails s
```

## 画像, CSSはどうすればいい？

一番単純なのは`app/assets/stylesheets/application.css`だけを編集して、画像は`app/assets/images/`に置くことです。

例えば、`app/assets/images/hoge.jpg`は`<%=image_path("hoge.jpg")%>`でアクセスできます。

CSSが複雑化してきたら、SCSSで綺麗に整頓していけるといいかもしれません。
