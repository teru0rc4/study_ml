# ml_sample
tensolflowの学習用

## imageのビルド
```
docker-compose build
```

## コンテナの起動、tensolflowサーバーの立ち上げ
```
docker-compose up -d
```

## ブラウザ上での確認
`http://localhost:3000/` へアクセスする。


# メンテナンスについて
pipenvによるライプラリインストールをコメントアウトして コンテナを起動
`docker-compose exec ml_service bash` でコンテナ内へ

コンテナ内で pipfile.lock をメンテナンスする
