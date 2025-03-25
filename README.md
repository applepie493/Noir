# Noir

1.必要なライブラリのインストール
```
curl -L https://raw.githubusercontent.com/noir-lang/noirup/refs/heads/main/install | bash
```
```
source /home/******/.bashrc
```
```
noirup
```

2.フロントエンド開発ツール
```
npm install -g create-react-app
```

3.メインプロジェクトディレクトリの作成
```
mkdir privacy-nft-proof && cd privacy-nft-proof
```

4.Noirサーキットプロジェクトの初期化
```
mkdir -p circuits
cd circuits
nargo init
cd ..
```

5.フロントエンドの初期化
```
npx create-react-app frontend --template typescript
```



参考文献

  ・https://noir-lang.org/docs/getting_started/quick_start/
