# Minecraft Bedrock Server on Docker

Docker上で [Minecraft Bedrock サーバー](https://www.minecraft.net/ja-jp/download/server/bedrock) を起動するための簡易的な Dockerfile を提供します。  

以下の種類を想定して作成していきます。
1. Alpine Linux
2. Distroless

## 作成した目的

Alpine Linux 上で マイクラ統合 (Minecraft Bedrock Dedicated Server) を実行するまでの最小限の手順を実験するために Docker 上で繰り返し実行するために作成。  
ついでに distroless もつくれればと思案中

## リンク

1. [マイクラサーバー JP](https://www.minecraft.net/ja-jp/download/server/bedrock)
2. [マイクラサーバー US](https://www.minecraft.net/en-us/download/server/bedrock)


## 参考になったサイト

1. [DockerのAlpineでglibc問題を一発解決する #dockerfile - Qiita](https://qiita.com/dojyorin/items/5a53b6eed77803d558ed)


## 実行の仕方

### Alpine Linux 版

1. [サーバー](https://www.minecraft.net/ja-jp/download/server/bedrock)をダウンロード
2. zipファイルの中身を `.\bedrock_server` に解凍
3. `docker compose up -d` で開始
