# Public
services= [
  'video'
  'illust'
  'manga'
  'book'

  'live'
  'channel'

  'channelarticle'
  'news'

  'tag_video'
  'tag_channel'
  'tag_channelarticle'
  'tag_news'
]

serviceURLs=
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


articleFields= [
  'cmsid'
  'title'
  'description'
  'comment_count'
  'last_comment_time'
  'thumbnail_key'
  'start_time'
  'update_time'
  'media_id'
  'media_name'
]

defaultFields= [
  'cmsid'
  'title'
  'description'
  'thumbnail_url'
  'start_time'
  'update_time'
  'view_counter'
  'comment_counter'
  'mylist_counter'
  'tags'
  'is_official'
  'channel_id'
  'genre'
  'author'
  'publisher'
  'label'
  'is_free'
  'price'
  'series_id'
  'series_number'
  'series'
  'cmsid'
  'title'
  'description'
  'thumbnail_url'
  'channel_id'
  'start_time'
  'charticle_ppv_type'
  'view_counter'
  'comment_counter'
  'mylist_counter'
  'is_sample'
  'is_member_only'
  'cmsid'
  'title'
  'description'
  'comment_count'
  'last_comment_time'
  'thumbnail_key'
  'start_time'
  'update_time'
  'media_id'
  'media_name'
]

sorts= [
  'start_time'
  'view_counter'
  'last_comment_time'
]

searches= [
  'title'
  'body'
  'caption'
  'tags'
]

module.exports= {services,serviceURLs,articleFields,defaultFields,sorts,searches}
