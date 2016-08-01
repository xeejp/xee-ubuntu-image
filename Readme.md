# xee-ubuntu-image
xeeを動作させるためのdocker imageです。
osはubuntuを使用しています。

# 使い方
## dockerのインストール
適当に調べて、dockerをインストールしてください。

## ターミナル内のコマンド
以下のコマンドでDocker Hubからimageを持ってくるか、Dockerfileをbuildしてimageを作成します。
```
docker pull notfounds/xee-ubuntu-image
```

ビルドコマンド
```
$ git clone https://github.com/xeejp/xee-ubuntu-image.git
$ cd ./xee-ubuntu-image
$ docker build -t xee-ubuntu-image .
```

以下のコマンドで、imageからコンテナを作成します。
ポート指定は、`ホストコンピュータのポート:コンテナ内のポート`となっています。ホストコンピュータのポートを使用中の場合は、適宜変更してください。
```
$ docker run -i -t -p 4000:4000 -p 5432:5432 xee-ubuntu-image
```

## dockerコンテナ内でのコマンド
データベース関係の設定を行います。
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

以下のように変更します。
```
  username: "postgres",
  password: "postgres",
  database: "xee_dev",
  hostname: "localhost",
  template: "template0",
  pool_size: 10
```

以下のコマンドで、サーバーが立ち上がります。
```
$$ yes | mix ecto.create
$$ mix ecto.migrate
$$ mix phoenix.server
```

## 実行確認
お好みのブラウザから[localhost:4000](localhost:4000)にアクセスします。
もし、トップページが表示された場合は成功。
エラーが出た場合は、修正するか報告してください。


# Usage
## Installation of docker
Please install 'docker' app.

## In your shell
Pull the image from DockerHub or Build Dockerfile.
```
docker pull notfounds/xee-ubuntu-image
```

Build command.
```
$ git clone https://github.com/xeejp/xee-ubuntu-image.git
$ cd ./xee-ubuntu-image
$ docker build -t xee-ubuntu-image .
```

Run the docker image.
Port assignment is `host computer's port : container's port`.
If host computer's port has been used, please change it.
```
$ docker run -i -t -p 4000:4000 -p 5432:5432 xee-ubuntu-image
```

## In the docker container
DB settings.
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

Launch the app.
```
$$ yes | mix ecto.create
$$ mix ecto.migrate
$$ mix phoenix.server
```

## In your browser
Access to [localhost:4000](localhost:4000).
If the page is shown, You're Success.
Else then You should Check the error messages. And Fix it or Report it to me.

# License
MIT License.
