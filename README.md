# Nicovideo [![NPM version][npm-image]][npm] [![Build Status][travis-image]][travis] [![Coverage Status][coveralls-image]][coveralls]

> ニコニコの検索APIラッパー

## Installation
### Via npm

```bash
$ npm install nicovideo --save
```

```js
var nicovideo= require('nicovideo');
console.log(nicovideo); //object
```

### Via bower

```bash
$ bower install nicovideo --save
```

```html
<script src="bower_components/nicovideo/nicovideo.min.js"></script>
<script>
  console.log(nicovideo); //object
</script>
```

### Via rawgit.com (the simple way)

```html
<script src="https://cdn.rawgit.com/59naga/nicovideo/889a3cf201abf269a9117d03b58dfef2d5ee6261/nicovideo.min.js"></script>
<script>
  console.log(nicovideo); //object
</script>
```

# コンテンツ検索API

* `query`には AND,OR,NOTなどの演算子が使用できます。
* `options`はPOST送信する`query`以外のパラメータです。未指定の場合は最大件数・最大フィールド数で取得を試みます。

> 詳しくは[コンテンツ検索API クエリ文字列仕様](http://search.nicovideo.jp/docs/api/contest.html#toc1)を参照してください。

## video(query,options) -> Promise({total,items})

ニコニコ動画を検索して、最大１００件を非同期で返します。

```js
var nicovideo= require('nicovideo');
var options= {};

nicovideo.video('初音ミク',options)
.then(function(result){
  console.log(result);
  // {
  //   "total": 225808,
  //   "items": [
  //     {
  //       "_rowid": 0,
  //       "channel_id": false,
  //       "cmsid": "sm27283023",
  //       "comment_counter": 0,
  //       "description": "＜ATLAS@台北駅の水着兄 Official Website＞<br />FB→http://tinyurl.com/kf7zc5j<br />YouTube→http://www.youtube.com/channel/UCIIoteRd_UrqG5sgEe-8Iog/<br />Twitter→http://twitter.com/atlas507<br />PV List→http://tinyurl.com/mq4rk2r<br /><br />＜録画の設備＞<br />Avermedia-C875(LGP)<br /><br />＜動画提供者＞<br />台湾プレイヤー：ATLAS@台北駅の水着兄<br /><br />＜動画情報＞<br />ボーカル1：初音ミク スクール競泳<br />ボーカル2：鏡音リン SW スクール<br />Video: 1280x720/60fps/4930Kbps<br />Audio: LC-AAC/48KHz/128Kbps<br />撮影日：2014/08/09<br /><br />＜其他PV＞<br />→PV(HD) mylist/31330662<br />",
  //       "last_comment_time": "2015-10-06 08:00:00",
  //       "mylist_counter": 1,
  //       "start_time": "2015-10-06 08:00:00",
  //       "tags": "VOCALOID ProjectDIVAArcade 初音ミク サマーアイドル スクール競泳 ProjectDIVAArcade外部出力 HD PV PDA",
  //       "thumbnail_url": "http://tn-skr4.smilevideo.jp/smile?i=27283023",
  //       "title": "【PDA-FT】サマーアイドル【PV／720p】【スクール競泳+SW スクール】",
  //       "update_time": "2015-10-06 08:00:01",
  //       "view_counter": 6,
  //       "url": "http://www.nicovideo.jp/watch/sm27283023"
  //     },
  //     {...more 99 items ...}
  //   ]
  // }
})
.catch(console.error);
```

## illust(query,options) -> Promise({total,items})

ニコニコ静画のイラストを検索して、最大１００件を非同期で返します。

```js

var nicovideo= require('nicovideo');
var options= {};

nicovideo.illust('初音ミク',options)
.then(function(result){
  console.log(result);
  // {
  //   "total": 77213,
  //   "items": [
  //     {
  //       "_rowid": 0,
  //       "cmsid": "im5243771",
  //       "comment_counter": 0,
  //       "description": "たまにはこういうのもあってもいいかな.....（。≧ω≦）ﾉ<br>ピンクみく様「なくていいです＞＜」<br>投稿してからベッドにパンツおいてるのにきづいた......",
  //       "last_comment_time": "1970-01-01 09:00:00",
  //       "mylist_counter": 2,
  //       "start_time": "2015-10-06 01:53:23",
  //       "tags": "VOCALOID 初音ミク MMD ピンクみく様 生け花ミクさん",
  //       "thumbnail_url": "http://lohas.nicoseiga.jp/thumb/5243771z",
  //       "title": "ピンクみく様「カメラマンさん！そこから動いちゃだめよ＞＜」",
  //       "update_time": "2015-10-06 01:57:38",
  //       "view_counter": 3,
  //       "url": "http://seiga.nicovideo.jp/seiga/im5243771"
  //     },
  //     {...more 99 items ...}
  //   ]
  // }
})
.catch(console.error);
```

## manga(query,options) -> Promise({total,items})

ニコニコ静画の漫画を検索して、最大１００件を非同期で返します。

```js

var nicovideo= require('nicovideo');
var options= {};

nicovideo.manga('初音ミク',options)
.then(function(result){
  console.log(result);
  // {
  //   "total": 106,
  //   "items": [
  //     {
  //       _rowid: 0,
  //       author: 'ド底辺ケツモドキ',
  //       channel_id: false,
  //       cmsid: '_comic18156',
  //       comment_counter: 6,
  //       description: '',
  //       is_official: 0,
  //       last_comment_time: '2015-10-03 23:23:26',
  //       mylist_counter: 0,
  //       start_time: '2015-10-03 12:18:43',
  //       tags: 'VOCALOID 初音ミク 鏡音リン ４コマ 自殺 首吊り',
  //       thumbnail_url: 'http://lohas.nicoseiga.jp/thumb/mg_thumb/0q',
  //       title: '初音ミクの自殺',
  //       update_time: '2015-10-05 17:18:05',
  //       view_counter: 592,
  //       url: 'http://seiga.nicovideo.jp/comic/18156' }
  //     },
  //     {...more 99 items ...}
  //   ]
  // }
})
.catch(console.error);
```

## book(query,options) -> Promise({total,items})

ニコニコ静画の電子書籍を検索して、最大１００件を非同期で返します。

```js
var nicovideo= require('nicovideo');
var options= {};

nicovideo.book('初音ミク',options)
.then(function(result){
  console.log(result);
  // {
  //   "total": 15,
  //   "items": [
  //     {
  //       "_rowid": 0,
  //       "author": "柴那典",
  //       "channel_id": 2607736,
  //       "cmsid": "bk282953",
  //       "comment_counter": 0,
  //       "description": "2007年、初音ミクの誕生で3度目の「サマー・オブ・ラブ」が始まった。気鋭の音楽ジャーナリストが綿密な取材を元にその全貌を描ききる、渾身の一作！キャラクター文化やオタク文化、ネット文化、新たなビジネスモデルの象徴……。様々な側面から語られてきた“初音ミク”の存在を初めて音楽の歴史に位置づけ、21世紀の新しい音楽のあり方を指し示す画期的な論考である。",
  //       "genre": "書籍 実用・新書",
  //       "is_free": 0,
  //       "label": "太田出版",
  //       "last_comment_time": false,
  //       "mylist_counter": 0,
  //       "price": 1382,
  //       "publisher": "太田出版",
  //       "series": "初音ミクはなぜ世界を変えたのか？",
  //       "series_id": 124670,
  //       "series_number": "1",
  //       "start_time": "2015-04-17 00:00:00",
  //       "tags": "初音ミクはなぜ世界を変えたのか？",
  //       "thumbnail_url": "https://nb.nimg.jp//book/static/img/book/000/282/953/dYurthsYtOGQPpSv.150x150.jpg?1429102917",
  //       "title": "初音ミクはなぜ世界を変えたのか？",
  //       "view_counter": 10,
  //       "url": "http://seiga.nicovideo.jp/watch/bk282953"
  //     },
  //     {...more 14 items ...}
  //   ]
  // }
})
.catch(console.error);
```

## live(query,options) -> Promise({total,items})

ニコニコ生放送を検索して、最大１００件を非同期で返します。

```js
var nicovideo= require('nicovideo');
var options= {};

nicovideo.live('初音ミク',options)
.then(function(result){
  console.log(result);
  // {
  //   "total": 1600,
  //   "items": [
  //     {
  //       "_rowid": 0,
  //       "author": false,
  //       "channel_id": 2606161,
  //       "cmsid": "lv237577691",
  //       "comment_counter": 0,
  //       "description": "初音ミクのコスプレシンガーとしてメディアで話題と注目を集めるかたわら、前代未聞のニューハーフカリスマ花嫁モデルとしても活躍中の麻倉ケイトがお送りする近未来型トーク番組！\r\n\r\nゲスト：西村梨絵",
  //       "start_time": "2015-10-27 21:00:00",
  //       "tags": "一般(その他) 麻倉ケイト 大阪ドロット ニューハーフ シンガーソングライター 初音ミク コスプレ ビューティー 一般",
  //       "thumbnail_url": "http://nl.simg.jp/img/a247/740805.4fc16f.jpg",
  //       "title": "麻倉ケイトのありのままで　第18回",
  //       "view_counter": 0,
  //       "url": "http://live.nicovideo.jp/watch/lv237577691"
  //     },
  //     {...more 99 items ...}
  //   ]
  // }
})
.catch(console.error);
```

## channel(query,options) -> Promise({total,items})

ニコニコチャンネルを検索して、最大１００件を非同期で返します。

```js
var nicovideo= require('nicovideo');
var options= {};

nicovideo.channel('初音ミク',options)
.then(function(result){
  console.log(result);
  // {
  //   "total": 15,
  //   "items": [
  //     {
  //       "_rowid": 0,
  //       "cmsid": "ch2608460",
  //       "description": "映画『脳漿炸裂ガール』公式ニコニコちゃんねる",
  //       "start_time": "2015-04-17 16:22:00",
  //       "tags": "GUMI エンターテイメント れるりり 初音ミク 映画『脳漿炸裂ガール』ニコニコちゃんねる 柏木ひなた 私立恵比寿中学 竹富聖花 脳漿炸裂ガール",
  //       "thumbnail_url": "http://icon.nimg.jp/channel/ch2608460.jpg",
  //       "title": "映画「脳漿炸裂ガール」チャンネル",
  //       "update_time": "2015-07-22 14:56:22",
  //       "url": "http://ch.nicovideo.jp/channel/ch2608460"
  //     },
  //     {...more 14 items ...}
  //   ]
  // }
})
.catch(console.error);
```

## channelarticle(query,options) -> Promise({total,items})

ニコニコ生放送のブログ記事を検索して、最大１００件を非同期で返します。

```js
var nicovideo= require('nicovideo');
var options= {};

nicovideo.channelarticle('初音ミク',options)
.then(function(result){
  console.log(result);
  // {
  //   "total": 439,
  //   "items": [
  //     {
  //       "_rowid": 0,
  //       "cmsid": "ar883766",
  //       "description": "<img src=\"http://www.c-lab.link/wp-content/uploads/2015/09/21mikubackpack03.jpg\" alt=\"21mikubackpack03\" /><br /><br /> いまや世界中で人気を集めているボーカロイドキャラクター「初音ミク」を再現したぬいぐるみ型のバックパック「Hatsune Miku Tag-Along Backpack」が登場しました。<br /><br /> 発売時期は2016年2月2日を予定しており、価格は49ドル約5,900円。海外のオタクグッズ専門オンラインショップ「welovefine」にて予約受付が実施されています。 <br /><br />対象年齢は14歳以上となっており、ぬいぐるみ部分は高さが20インチ50cmとかなり大きめ。頭からつま先までを含めてサイズなので、実際に使うとそこまでの大きさは感じなさそうですね。<br /><br /> 　 <a href=\"http://www.c-lab.link/other/49107\" class=\"rssLink\">【そのほかの画像や動画、リンクなどは元記事でどうぞ】</a>\n<h2>■ぬいぐるみミクさんと一緒におでかけだ</h2>\n　 ミクさんの背面に用意されている収納部分は横幅が4.5インチ約11cmで、深さは6インチ約15cm。少し大きめのポケットといった感じなので、スマホや定期などが入",
  //       "start_time": "2015-10-04 12:00:00",
  //       "title": "【ミクデスヨー】「初音ミク」ぬいぐるみリュックが登場、ミクさんを背負っておでかけだ！"
  //     },
  //     {...more 99 items ...}
  //   ]
  // }
})
.catch(console.error);
```

## news(query,options) -> Promise({total,items})

ニコニコニュースを検索して、最大１００件を非同期で返します。

```js
var nicovideo= require('nicovideo');
var options= {};

nicovideo.news('初音ミク',options)
.then(function(result){
  console.log(result);
  // {
  //   "total": 4116,
  //   "items": [
  //     {
  //       "_rowid": 0,
  //       "cmsid": "nw1828733",
  //       "description": "2015年12月17日発売予定、人気アニメのキャラクター総勢47名が一同に介してライブパフォーマンスを繰り広げるPS Vita用リズムアクションゲーム『ミラクルガールズフェスティバル』。本作は『初音ミク -Project DIVA-』シリーズのシステムを活かし、グラフィックはアニメの2Dキャラクターたちが持つ柔らかな印象をそのまま3Dモデルで再現した作品です。\n\n【大きい画像を見る】【特集】『ミラクルガールズフェスティバル』開発者が語る“可愛さ表現”の極意！演出はアニサマの様なライブを意識、表情やカメラにも拘りが\n\n\n\n\n原作ファンならニヤリとするであろうステージ上のパフォーマンスや熱気溢れる",
  //       "last_comment_time": false,
  //       "media_id": 156,
  //       "start_time": "2015-10-05 21:04:54",
  //       "thumbnail_key": "917/1620917",
  //       "title": "【特集】『ミラクルガールズフェスティバル』開発者が語る“可愛さ表現”の極意！演出はアニサマの様なライブを意識、表情やカメラにも拘りが",
  //       "update_time": "2015-10-05 21:18:06",
  //       "url": "http://news.nicovideo.jp/watch/nw1828733"
  //     },
  //     {...more 99 items ...}
  //   ]
  // }
})
.catch(console.error);
```

# 関連タグ検索API

コンテンツ検索APIとは違い、ほとんどのパラメータが使用できません。
引数を省略した場合、件数が多いタグから順番に取得します。

> 詳しくは[関連タグ検索API](http://search.nicovideo.jp/docs/api/contest.html#toc3)を参照してください。

## videoTag(query,options) -> Promise({total,items})

ニコニコ動画から`query`文字列を含むタグを検索して、最大１００件を非同期で返します。

```js
var nicovideo= require('nicovideo');
var options= {};

nicovideo.videoTag()
.then(function(result){
  console.log(result);
  // {
  //   "total": 1509956,
  //   "items": [
  //     {
  //       "_rowid": 0,
  //       "tag": "ゲーム",
  //       "tag_counter": 5744708
  //     },
  //     {...more 99 items...}
  //   ]
  // }
})
.catch(console.error);
```

## illustTag(query,options) -> Promise({total,items})

ニコニコ静画のイラストから`query`文字列を含むタグを検索して、最大１００件を非同期で返します。

```js
var nicovideo= require('nicovideo');
var options= {};

nicovideo.illustTag()
.then(function(result){
  console.log(result);
  // {
  //   "total": 191123,
  //   "items": [
  //     {
  //       "_rowid": 0,
  //       "tag": "オリジナル",
  //       "tag_counter": 386923
  //     },
  //     {...more 99 items...}
  //   ]
  // }
})
.catch(console.error);
```

## mangaTag(query,options) -> Promise({total,items})

ニコニコ静画の漫画から`query`文字列を含むタグを検索して、最大１００件を非同期で返します。

```js
var nicovideo= require('nicovideo');
var options= {};

nicovideo.mangaTag()
.then(function(result){
  console.log(result);
  // {
  //   "total": 7966,
  //   "items": [
  //     {
  //       "_rowid": 0,
  //       "tag": "オリジナル",
  //       "tag_counter": 1133
  //     },
  //     {...more 99 items...}
  //   ]
  // }
})
.catch(console.error);
```

## bookTag(query,options) -> Promise({total,items})

ニコニコ静画の電子書籍から`query`文字列を含むタグを検索して、最大１００件を非同期で返します。

```js
var nicovideo= require('nicovideo');
var options= {};

nicovideo.bookTag()
.then(function(result){
  console.log(result);
  // {
  //   "total": 23205,
  //   "items": [
  //     {
  //       "_rowid": 0,
  //       "tag": "BL",
  //       "tag_counter": 3936
  //     },
  //     {...more 99 items...}
  //   ]
  // }
})
.catch(console.error);
```

## liveTag(query,options) -> Promise({total,items})

ニコニコ生放送から`query`文字列を含むタグを検索して、最大１００件を非同期で返します。

```js
var nicovideo= require('nicovideo');
var options= {};

nicovideo.liveTag()
.then(function(result){
  console.log(result);
  // {
  //   "total": 131206,
  //   "items": [
  //     {
  //       "_rowid": 0,
  //       "tag": "ゲーム",
  //       "tag_counter": 619430
  //     },
  //     {...more 99 items...}
  //   ]
  // }
})
.catch(console.error);
```

## channelTag(query,options) -> Promise({total,items})

ニコニコチャンネルから`query`文字列を含むタグを検索して、最大１００件を非同期で返します。

```js
var nicovideo= require('nicovideo');
var options= {};

nicovideo.channelTag()
.then(function(result){
  console.log(result);
  // {
  //   "total": 6533,
  //   "items": [
  //     {
  //       "_rowid": 0,
  //       "tag": "エンターテイメント",
  //       "tag_counter": 2755
  //     },
  //     {...more 99 items...}
  //   ]
  // }
})
.catch(console.error);
```

## channelarticleTag(query,options) -> Promise({total,items})

ニコニコチャンネルのブログ記事から`query`文字列を含むタグを検索して、最大１００件を非同期で返します。

```js
var nicovideo= require('nicovideo');

nicovideo.channelarticleTag()
.then(function(result){
  console.log(result);
  // {
  //   "total": 15535,
  //   "items": [
  //     {
  //       "_rowid": 0,
  //       "tag": "競馬",
  //       "tag_counter": 1574
  //     },
  //     {...more 99 items...}
  //   ]
  // }
})
.catch(console.error);
```

## newsTag(query,options) -> Promise({total,items})

ニコニコニュースから`query`文字列を含むタグを検索して、最大１００件を非同期で返します。

```js
var nicovideo= require('nicovideo');

nicovideo.newsTag()
.then(function(result){
  console.log(result);
  // {
  //   "total": 34623,
  //   "items": [
  //     {
  //       "_rowid": 0,
  //       "tag": "エンタメ",
  //       "tag_counter": 301886
  //     },
  //     {...more 99 items...}
  //   ]
  // }
})
.catch(console.error);
```

## vita(apiName,params,axiosOptions) -> Promise(data)

`CORS`に抵触するため、NodeJSでのみ利用可能なことに注意して下さい。

> `params`の詳細は[ニコニコAPIリストwiki - Vita API 一覧](http://www59.atwiki.jp/nicoapi/pages/24.html)を確認してください。

```js
var nicovideo= require('nicovideo');

nicovideo.vita('liveInfo',{v:'lv237721545'})
.then(function(result){
  console.log(result);
  // {
  //   "nicolive_video_response": {
  //     "video_info": {
  //       "video": {
  //         "id": "lv237721545",
  //         "title": "ふえいふ暗",
  //         "description": "ノイズフィルターが届いたので若干音質が向上しました、ので忍者殺す\n\n今回の目標\n\n・錬成を活用する\n・クラス変更を活用する\n\n・主人公をまともに使う\n\n・カミラさんを強くする（弱いらしい）\n\n\n\nSE　ハード初見　暗夜\n\n白夜はクリア",
  //         "user_id": "270219",
  //         "open_time": "2015-10-07 20:03:49",
  //         "start_time": "2015-10-07 20:03:56",
  //         "end_time": "2015-10-07 20:33:56",
  //         "provider_type": "community",
  //         "related_channel_id": "",
  //         "_currentstatus": "closed",
  //         "hidescore_online": "0",
  //         "hidescore_comment": "0",
  //         "community_only": "0",
  //         "channel_only": "0",
  //         "view_counter": "9",
  //         "comment_count": "0",
  //         "_timeshift_limit": "7",
  //         "_ts_archive_released_time": "",
  //         "_use_tsarchive": "0",
  //         "_ts_archive_start_time": "",
  //         "_ts_archive_end_time": "",
  //         "_ts_view_limit_num": "1",
  //         "_ts_is_endless": "0",
  //         "_ts_reserved_count": "0",
  //         "timeshift_enabled": "0",
  //         "is_hq": "0"
  //       },
  //       "community": {
  //         "id": "1687166",
  //         "name": "麺の惑星",
  //         "description": "　クリア済み\nPortal（PC）\n伝説のオウガバトル（SS）\nアンリミテッド・サガ（PS2）（アーミック・ルビィ・ジュディ編）\nタクティクス・オウガ（SS）\nファイアーエムブレム 新・暗黒竜と光の剣 （DS）\nファイアーエムブレム 新・紋章の謎（DS）\nファイアーエムブレム聖戦の系譜\nスーパーロボット大戦K",
  //         "public": "1",
  //         "global_id": "co1687166",
  //         "user_count": "68",
  //         "level": "13",
  //         "thumbnail": "http://icon.nimg.jp/community/168/co1687166.jpg?1439118150",
  //         "thumbnail_small": "http://icon.nimg.jp/community/s/168/co1687166.jpg?1439118150"
  //       },
  //       "livetags": {
  //         "category": {
  //           "livetag": "ゲーム"
  //         },
  //         "free": {
  //           "livetag": "ファイアーエムブレム"
  //         }
  //       }
  //     },
  //     "@status": "ok"
  //   }
  // }
})
.catch(console.error);
```

`apiName`に使用可能なキーワードは下記のとおりです。

* `sessionCreate`
    => `/api/v1/session.create`

* `sessionAlive` # [セッション要]
    => `/api/v1/session.alive`

* `userInfo`
    => `/api/v1/user.info`

* `userPremium` # [セッション要]
    => `/api/v1/user.premium`

* `achieveSet`
    => `/api/v1/achieve.set`

* `stepXRanking`
    => `/api/v1/step.X.ranking`

* `stepXAroundranking`
    => `/api/v1/step.X.aroundranking`

* `stepXReporter`
    => `/api/v1/step.X.reporter`

* `stepReportable` # [セッション要]
    => `/api/v1/step.reportable`

* `communityInfo`
    => `/api/v1/community.info`

* `communityArray`
    => `/api/v1/community.array`

* `comunityList` # [セッション要]
    => `/api/v1/comunity.list`

* `systemUnixtime`
    => `/api/v1/system.unixtime`

* `blogInfo`
    => `/api/v1/blog.info`

* `nicoUserMyvideo`
    => `/nicoapi/v1/user.myvideo`

* `nicoVideoInfo`
    => `/nicoapi/v1/video.info`

* `nicoVideoArray`
    => `/nicoapi/v1/video.array`

* `nicoVideoPlay`
    => `/nicoapi/v1/video.play`

* `nicoVideoPlaylen` # [?]
    => `/nicoapi/v1/video.playlen`

* `nicoVideoRelation`
    => `/nicoapi/v1/video.relation`

* `nicoVideoRanking`
    => `/nicoapi/v1/video.ranking`

* `nicoVideoSherlock`
    => `/nicoapi/v1/video.sherlock`

* `nicoVideoCeselected`
    => `/nicoapi/v1/video.ceselected`

* `nicoWiiuRanking`
    => `/nicoapi/v1/wiiu.ranking`

* `nicoWiiuTrendytag`
    => `/nicoapi/v1/wiiu.trendytag`

* `nicoMylistgroupGet`
    => `/nicoapi/v1/mylistgroup.get`

* `nicoDeflistList`
    => `/nicoapi/v1/deflist.list`

* `nicoDeflistAdd` # [セッション要]
    => `/nicoapi/v1/deflist.add`

* `nicoMylistList`
    => `/nicoapi/v1/mylist.list`

* `nicoMylistAdd` # [セッション要]
    => `/nicoapi/v1/mylist.add`

* `nicoMylistSearch`
    => `/nicoapi/v1/mylist.search`

* `nicoVideoChannelrecentvideo`
    => `/nicoapi/v1/video.channelrecentvideo`

* `nicoVideoChannelselected`
    => `/nicoapi/v1/video.channelselected`

* `nicoVideoSearch`
    => `/nicoapi/v1/video.search`

* `nicoTagSearch`
    => `/nicoapi/v1/tag.search`

* `nicoGenreList` # group: 1 を付けるとグループカテゴリー読み込み
    => `/nicoapi/v1/genre.list`

* `liveInfo`
    => `/liveapi/v1/video.info`

* `liveArray`
    => `/liveapi/v1/video.array`
    
* `livePlay` # [セッション要]
    => `/liveapi/v1/video.play`

* `liveOnairlist`
    => `/liveapi/v1/video.onairlist`

* `liveComingsoon`
    => `/liveapi/v1/video.comingsoon`

* `liveSearchSolr`
    => `/liveapi/v1/video.search.solr`

* `liveUserSubscribe` # [セッション要]
    => `/liveapi/v1/user.subscribe`

License
---
[MIT][License]

[License]: http://59naga.mit-license.org/

[sauce-image]: http://soysauce.berabou.me/u/59798/nicovideo.svg
[sauce]: https://saucelabs.com/u/59798
[npm-image]:https://img.shields.io/npm/v/nicovideo.svg?style=flat-square
[npm]: https://npmjs.org/package/nicovideo
[travis-image]: http://img.shields.io/travis/59naga/nicovideo.svg?style=flat-square
[travis]: https://travis-ci.org/59naga/nicovideo
[coveralls-image]: http://img.shields.io/coveralls/59naga/nicovideo.svg?style=flat-square
[coveralls]: https://coveralls.io/r/59naga/nicovideo?branch=master
