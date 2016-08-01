# xee-ubuntu-image
xeeを動作させるためのdocker imageです。
osはubuntuを使用しています。

# 使い方
## dockerのインストール
適当に調べて、dockerをインストールしてください。

## ターミナル内のコマンド
```
$ git clone https://github.com/xeejp/xee-ubuntu-image.git
$ cd ./xee-ubuntu-image
$ docker build -t xee-ubuntu-image .
$ docker run -i -t -p 4000:4000 -p 5432:5432 xee-ubuntu-image
```

## dockerコンテナ内でのコマンド
```
$$ /etc/init.d/postgresql start
$$ su - postgres
$$ psql       データベースを開く
$$$ \password パスワードの設定
$$$ postgres
$$$ postgres
$$$ \q        データベース内の操作を終了
$$ vim ./config/dev.exs
```

以下のように変更
```
  username: "postgres",
  password: "postgres",
  database: "xee_dev",
  hostname: "localhost",
  template: "template0",
  pool_size: 10
```

```
$$ yes | mix ecto.create
$$ mix ecto.migrate
$$ mix phoenix.server
```

## お好みのブラウザで実行確認
`localhost:4000`にアクセス
もし、トップページが表示された場合は成功。
エラーが出た場合は、修正するか報告してください。


# Usage
## Installation of docker
Please install 'docker' app.

## In your shell
```
$ git clone https://github.com/xeejp/xee-ubuntu-image.git
$ cd ./xee-ubuntu-image
$ docker build -t xee-ubuntu-image .
$ docker run -i -t -p 4000:4000 -p 5432:5432 xee-ubuntu-image
```

## In the docker container
```
$$ /etc/init.d/postgresql start
$$ su - postgres
$$ psql       データベースを開く
$$$ \password パスワードの設定
$$$ postgres
$$$ postgres
$$$ \q        データベース内の操作を終了
$$ vim ./config/dev.exs
```

Change.
```
  username: "postgres",
  password: "postgres",
  database: "xee_dev",
  hostname: "localhost",
  template: "template0",
  pool_size: 10
```

```
$$ yes | mix ecto.create
$$ mix ecto.migrate
$$ mix phoenix.server
```

## In your browser
Access to `localhost:4000`.
If the page is shown, You're Success.
Else then You should Check the error messages. And Fix it or Report it to me.

# License
MIT License.
