# Nicovideo [![NPM version][npm-image]][npm] [![Build Status][travis-image]][travis] [![Coverage Status][coveralls-image]][coveralls]

> ニコニコ動画[Mashup Awards 10向け提供API][0]ラッパー

[0]: http://search.nicovideo.jp/docs/api/contest.html

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
<script src="https://cdn.rawgit.com/59naga/nicovideo/6a5f0d147144d0d2ca74721c3a8f45dc8b4807f6/nicovideo.min.js"></script>
<script>
  console.log(nicovideo); //object
</script>
```

# コンテンツ検索API

* `query`には AND,OR,NOTなどの演算子が使用できます。 [クエリ文字列仕様][1]を参照
* `options`はPOST送信する`query`以外のパラメータです。未指定の場合は最大件数（`options.from=0`,`options.size=100`）・最大フィールド数で取得を試みます。
* ニコニコニュース以外は、コンテンツへのURLを自動で付与します。
* サイムネイル画像は拡大可能であれば、そのURLに差し替えます。

[1]: http://search.nicovideo.jp/docs/api/contest.html#toc1

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

## manga(query,options) -> Promise({total,items})

ニコニコ静画の漫画を検索して、最大１００件を非同期で返します。

## book(query,options) -> Promise({total,items})

ニコニコ静画の電子書籍を検索して、最大１００件を非同期で返します。

## live(query,options) -> Promise({total,items})

ニコニコ生放送を検索して、最大１００件を非同期で返します。

## channel(query,options) -> Promise({total,items})

ニコニコチャンネルを検索して、最大１００件を非同期で返します。

## channelarticle(query,options) -> Promise({total,items})

ニコニコ生放送のブログ記事を検索して、最大１００件を非同期で返します。

## news(query,options) -> Promise({total,items})

ニコニコニュースを検索して、最大１００件を非同期で返します。

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

## mangaTag(query,options) -> Promise({total,items})

ニコニコ静画の漫画から`query`文字列を含むタグを検索して、最大１００件を非同期で返します。

## bookTag(query,options) -> Promise({total,items})

ニコニコ静画の電子書籍から`query`文字列を含むタグを検索して、最大１００件を非同期で返します。

## liveTag(query,options) -> Promise({total,items})

ニコニコ生放送から`query`文字列を含むタグを検索して、最大１００件を非同期で返します。

## channelTag(query,options) -> Promise({total,items})

ニコニコチャンネルから`query`文字列を含むタグを検索して、最大１００件を非同期で返します。

## channelarticleTag(query,options) -> Promise({total,items})

ニコニコチャンネルのブログ記事から`query`文字列を含むタグを検索して、最大１００件を非同期で返します。

## newsTag(query,options) -> Promise({total,items})

ニコニコニュースから`query`文字列を含むタグを検索して、最大１００件を非同期で返します。

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
