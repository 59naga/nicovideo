# Dependencies
require('es6-promise').polyfill()
axios= require 'axios'

# Environment
api=
  search: 'http://api.search.nicovideo.jp/api/'
  tag: 'http://api.search.nicovideo.jp/api/tag/'

{services,serviceURLs,articleFields,defaultFields,sorts,searches}= require './default'

# Public
class Nicovideo
  video: (query,request={})->
    request.service= ['video']

    @search query,request

  illust: (query,request={})->
    request.service= ['illust']

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

  videoTag: (query,request={})->
    request.service= ['tag_video']

    @tag query,request

  illustTag: (query,request={})->
    request.service= ['tag_illust']

    @tag query,request

  liveTag: (query,request={})->
    request.service= ['tag_live']

    @tag query,request

  mangaTag: (query,request={})->
    request.service= ['tag_manga']

    @tag query,request

  bookTag: (query,request={})->
    request.service= ['tag_book']

    @tag query,request

  channelTag: (query,request={})->
    request.service= ['tag_channel']

    @tag query,request

  channelarticleTag: (query,request={})->
    request.service= ['tag_channelarticle']

    @tag query,request

  newsTag: (query,request={})->
    request.service= ['tag_news']

    @tag query,request

  tag: (query,request={})->
    request.query= query if query?
    request.from?= 0
    request.size?= 100

    request.reason= 'ma10'
    request.issuer= 'node-nicovideo'

    axios.post api.tag,request
    .then (response)->
      raw= response.data

      if raw.errid?
        raw.request= request
        throw JSON.stringify raw

      chunks=
        for line in raw.trim().split '\n'
          try
            JSON.parse line

      total= chunks[1].values[0].total
      items= chunks[0].values

      {total,items}

  search: (query,request={},addURL=yes)->
    throw new Error 'query is not defined' unless query?

    request.query= query
    request.from?= 0
    request.size?= 100

    request.search?= searches
    request.filters?= []

    isArticle= request.service[0] in ['channelarticle','news']
    if isArticle
      request.join?= articleFields
    else
      request.join?= defaultFields

    request.sort_by?= sorts[0]
    request.order?= 'desc'

    request.reason= 'ma10'
    request.issuer= 'node-nicovideo'

    axios.post api.search,request
    .then (response)->
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

      serviceURL= serviceURLs[request.service[0]]
      if addURL and serviceURL
        for item in items
          item.url?= serviceURL + item.cmsid
          item.url= item.url.replace 'comic/_comic','comic/'

      {total,items}

module.exports= new Nicovideo
module.exports.Nicovideo= Nicovideo
