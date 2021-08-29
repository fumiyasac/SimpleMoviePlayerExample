// 参考: json-serverの実装に関する参考資料
// https://blog.eleven-labs.com/en/json-server

// Mock用のJSONレスポンスサーバーの初期化設定
const jsonServer = require('json-server');
const server = jsonServer.create();

// Database構築用のJSONファイル
const router = jsonServer.router('datasource/db.json');

// 各種設定用
const middlewares = jsonServer.defaults();
const rewrite_rules = jsonServer.rewriter({
    "/api/v1/simple_movie/banners" : "/get_main_banners",
    "/api/v1/simple_movie/news" : "/get_main_news",
    "/api/v1/simple_movie/main_movies" : "/get_main_movies",
    "/api/v1/simple_movie/main_movies/:id" : "/get_main_movies/:id",
    "/api/v1/simple_movie/featured_movies" : "/get_featured_movies",
    "/api/v1/simple_movie/profile/me" : "/get_profile_me",
    "/api/v1/simple_movie/profile/activities" : "/get_profile_activities_me",
    "/api/v1/simple_movie/profile/comments" : "/get_profile_comments_me"
});

// リクエストのルールを設定する
server.use(rewrite_rules);

// ミドルウェアを設定する (※コンソール出力するロガーやキャッシュの設定等)
server.use(middlewares);

// 受信したリクエストにおいてGET送信時のみ許可する
server.use(function (req, res, next) {
    if (req.method === 'GET') {
        next();
    }
});

// ルーティングを設定する
server.use(router);

// サーバをポート3000で起動する
server.listen(3000, () => {
    console.log('SimpleMoviePlayerExample Mock Server is running...');
});