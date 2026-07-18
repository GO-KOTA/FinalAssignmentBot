# FinalAssignmentBot

Discordチャンネルの会話履歴を、Google Geminiを使って議事録に整理するBotです。

生成結果は次の項目に分類されます。

- 話題
- 決定事項
- 担当作業
- 期限
- 保留事項

生成AIへ送信するときはDiscordの表示名を使わず、発言者を `参加者1`、`参加者2` のように置き換えます。

## コマンド

- `/議事録`：現在のチャンネルの直近30件から議事録を作る
- `/議事録 件数:50`：5〜100件の範囲で読み取る件数を指定する
- `/help`：使い方を表示する

## Discordでなければできない点

Botへの質問文だけをAIへ送るのではなく、複数メンバーが普段使っているDiscordチャンネルの会話履歴を取得します。会議専用の別サービスへ全員が文章をコピーすることなく、その場で決定事項や作業を共有できます。スレッド内で実行した場合は、そのスレッドの会話だけを議事録にできます。

## 起動方法

1. このフォルダで `npm install` を実行する
2. `.env` を作成する
3. Discord Developer PortalでBotの `Message Content Intent` を有効にする
4. Botへ次の権限を付けてサーバーへ招待する
   - View Channels（チャンネルを見る）
   - Send Messages（メッセージを送信）
   - Read Message History（メッセージ履歴を読む）
   - Use Application Commands（アプリコマンドを使用）
5. `npm start` を実行する

環境変数：

```text
DISCORD_TOKEN=Discord Botのトークン
GEMINI_API_KEY=Gemini APIのキー
GEMINI_MODEL=gemini-3-flash-preview
```

トークンやAPIキーはGitHubへ保存しないでください。

## Dockerで起動する場合

`.env`を作成してから、次を実行します。

```bash
docker compose up --build
```

停止する場合：

```bash
docker compose down
```

起動後、ブラウザで `http://localhost:3000` を開くと稼働確認ができます。

## Render設定

- Runtime：Node
- Build Command：`npm install`
- Start Command：`npm start`
- 環境変数：`DISCORD_TOKEN`、`GEMINI_API_KEY`、必要なら `GEMINI_MODEL`

RenderのURLへアクセスすると `FinalAssignmentBot is running` と表示されます。
