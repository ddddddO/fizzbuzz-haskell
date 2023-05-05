# fizzbuzz-haskell

## [中断] FizzBuzz Server を作るまで
- プロジェクトルートで、`stack new server servant` を実行し、`server` ディレクトリ生成。色々デフォで生成された。
  - https://docs.servant.dev/en/stable/tutorial/install.html#stack

- server ディレクトリで以下を実行
  ```console
  # build. 初回かなり時間かかった。
  $ stack build
  # start server. suffixに `-exe` がつくのに注意
  $ stack exec server-exe
  ```

- 次はこの辺り読んでやってみる
  - https://docs.servant.dev/en/stable/tutorial/ApiType.html