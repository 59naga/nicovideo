# Dependencies
axios= require 'axios'

# Environment
api= 'http://api.search.nicovideo.jp/api/'

# Private
defaultFields= [
  # 共通（counterは一部取得できない）
  'cmsid'
  'title'
  'description'
  'thumbnail_url'

  'start_time'
  'update_time'
  'last_comment_time'

  'view_counter'
  'comment_counter'
  'mylist_counter'

  'tags'

  # 動画コンテンツ検索
  'channel_id'
  'main_community_id'
  'length_seconds'

  # 生放送コンテンツ検索
  'community_id'
  'community_icon'
  'open_time'
  'end_time'
  'score_timeshift_reserved'
  'provider_type'
  'channel_id'
  'live_status'
  'member_only'

  # マンガコンテンツ検索
  'is_official'
  'serial_status'
  # 'channel_id'
  'episode_count'

  # 書籍コンテンツ検索
  # 'is_official'
  'is_sample'
  # 'channel_id'
  'genre'
  'author'
  'publisher'
  'label'
  'is_free'
  'price'
  'series_id'
  'series_number'
  'series'

  # ブロマガ記事コンテンツ検索
  'charticle_ppv_type'
  'is_member_only'

  # ニュースコンテンツ検索
  'thumbnail_key'
  'media_id'
  'media_name'
]
urls=
  video:
    'http://www.nicovideo.jp/watch/'

  illust:
    'http://seiga.nicovideo.jp/seiga/'

  manga:
    'http://seiga.nicovideo.jp/comic/'

  book:
    'http://seiga.nicovideo.jp/watch/'

  live:
    'http://live.nicovideo.jp/watch/'

  channel:
    'http://ch.nicovideo.jp/channel/'

  # 使用出来ない
  # channelarticle:
  #   'http://ch.nicovideo.jp/blomaga/'

  news:
    'http://news.nicovideo.jp/watch/'

# Public
class Search
  video: (query,request={})->
    request.service= ['video']

    @search query,request

  illust: (query,request={})->
    request.service= ['illust']
    unless request.filters?
      request.filters= []
      request.filters.push
        type: 'equal'
        field: 'illust_type'
        value: 0

    @search query,request

  manga: (query,request={})->
    request.service= ['manga']

    @search query,request

  book: (query,request={})->
    request.service= ['book']

    @search query,request

  live: (query,request={})->
    request.service= ['live']

    @search query,request

  channel: (query,request={})->
    request.service= ['channel']

    @search query,request

  channelarticle: (query,request={})->
    request.service= ['channelarticle']

    @search query,request

  news: (query,request={})->
    request.service= ['news']

    @search query,request
  
  search: (query,request={},normalize=yes)->
    throw new Error 'query is not defined' unless query?

    request.query= query
    request.from?= 0
    request.size?= 100

    request.search?= ['title','description','body','caption','tags']

    # 'description'が使用できない
    isBook= request.service[0] in ['book']
    if isBook
      request.search= request.search?.filter (name)->
        name isnt 'description'

    request.filters?= []

    request.join?= defaultFields

    # 'view_counter'が使用できない
    isArticle= request.service[0] in ['channelarticle','news']
    if isArticle
      request.join= request.join?.filter (name)->
        name isnt 'view_counter'

    request.sort_by?= 'start_time'
    request.order?= 'desc'

    request.reason= 'ma10'
    request.issuer= 'node-nicovideo'

    axios.post api,request
    .then (response)=>
      raw= response.data

      if raw.errid?
        raw.request= request
        throw JSON.stringify raw

      chunks=
        for line in raw.trim().split '\n'
          try
            JSON.parse line

      total= chunks[0].values[0].total
      items= []
      items= items.concat chunks[i].values for i in [2...chunks.length-1]

      if normalize
        for item in items
          @normalizeSearch request.service[0],item

      {total,items}

  normalizeSearch: (service,item)->
    item.service= service

    serviceURL= urls[service]
    if serviceURL and not item.url?
      item.url= serviceURL + item.cmsid
      item.url= item.url.replace 'comic/_comic','comic/'
    
    # タイトル -> 正規化
    item.title= item.title.replace /&amp;/g,'&' if item.title.replace

    # タグ -> 正規化／配列化
    item.tags= item.tags.replace(/&amp;/g,'&').split ' ' if item.tags?.replace

    # イラストサムネイル -> 拡大（春画表示）
    if item.thumbnail_url?.replace
      item.thumbnail_url= item.thumbnail_url.replace /z$/,'i'

    # 電子書籍サムネイル -> 拡大
    if item.thumbnail_url?.replace
      item.thumbnail_url= item.thumbnail_url.replace '.150x150.jpg','.410x410.jpg'

    # ニュース -> 正規化
    if item.thumbnail_key
      item.thumbnail_url= 'http://p.news.nimg.jp/photo/'+item.thumbnail_key+'l.jpg'

    # サムネイル拡大
    if service is 'video' and item.cmsid.slice(2) >= 16371845
      item.thumbnail_url+= '.L'

    item
  
module.exports= new Search
module.exports.Search= Search
