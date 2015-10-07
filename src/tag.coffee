# Dependencies
axios= require 'axios'

# Environment
api= 'http://api.search.nicovideo.jp/api/tag/'

class Tag
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

  tag: (query,request={},normalize=yes)->
    request.query= query if query?
    request.from?= 0
    request.size?= 100

    request.reason= 'ma10'
    request.issuer= 'node-nicovideo'

    axios.post api,request
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

      if normalize
        items=
          for item in items
            item.tag= item.tag.replace /&amp;/g,'&'
            item

      {total,items}

module.exports= new Tag
module.exports.Tag= Tag
