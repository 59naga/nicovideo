# Dependencies
nicovideo= require '../src'

# https://developer.mozilla.org/ja/docs/Web/JavaScript/Guide/Regular_Expressions
escapeRegExp= (string)->
  string.replace /([.*+?^=!:${}()|[\]\/\\])/g, '\\$1'

describe '.search',->
  query= '初音ミク'

  it '.video',(done)->
    urlPrefix= 'http://www.nicovideo.jp/watch/sm'
    urlPrefixRegExp= new RegExp '^'+(escapeRegExp urlPrefix)

    nicovideo.video query
    .catch done.fail
    .then (result)->
      {total,items}= result

      expect(total).toBeGreaterThan 225000
      expect(items.length).toBe 100

      for item in items
        expect(item.title).not.toMatch '&amp;'
        expect(item.tags.join()).not.toMatch '&amp;'
        expect(item.url).toMatch urlPrefixRegExp
        expect(item.thumbnail_url).toBeTruthy()

      done()

  it '.illust',(done)->
    urlPrefix= 'http://seiga.nicovideo.jp/seiga/im'
    urlPrefixRegExp= new RegExp '^'+(escapeRegExp urlPrefix)

    nicovideo.illust query
    .catch done.fail
    .then (result)->
      {total,items}= result

      expect(total).toBeGreaterThan 76000
      expect(items.length).toBe 100

      for item in items
        expect(item.title).not.toMatch '&amp;'
        expect(item.tags.join()).not.toMatch '&amp;'
        expect(item.url).toMatch urlPrefixRegExp
        expect(item.thumbnail_url).not.toMatch /z$/

      done()

  it '.manga',(done)->
    urlPrefix= 'http://seiga.nicovideo.jp/comic/'
    urlPrefixRegExp= new RegExp '^'+(escapeRegExp urlPrefix)

    nicovideo.manga query
    .catch done.fail
    .then (result)->
      {total,items}= result

      expect(total).toBeGreaterThan 100
      expect(items.length).toBe 100

      for item in items
        expect(item.title).not.toMatch '&amp;'
        expect(item.tags.join()).not.toMatch '&amp;'
        expect(item.url).toMatch urlPrefixRegExp
        expect(item.thumbnail_url).toBeTruthy()

      done()

  it '.book',(done)->
    urlPrefix= 'http://seiga.nicovideo.jp/watch/bk'
    urlPrefixRegExp= new RegExp '^'+(escapeRegExp urlPrefix)

    nicovideo.book query
    .catch done.fail
    .then (result)->
      {total,items}= result

      expect(total).toBeGreaterThan 10
      expect(items.length).toBeGreaterThan 10

      for item in items
        expect(item.title).not.toMatch '&amp;'
        expect(item.tags.join()).not.toMatch '&amp;'
        expect(item.url).toMatch urlPrefixRegExp
        expect(item.thumbnail_url).toMatch '.410x410.jpg'

      done()

  it '.live',(done)->
    urlPrefix= 'http://live.nicovideo.jp/watch/lv'
    urlPrefixRegExp= new RegExp '^'+(escapeRegExp urlPrefix)

    nicovideo.live query
    .catch done.fail
    .then (result)->
      {total,items}= result

      expect(total).toBeGreaterThan 1500
      expect(items.length).toBe 100

      for item in items
        expect(item.title).not.toMatch '&amp;'
        expect(item.tags.join()).not.toMatch '&amp;'
        expect(item.url).toMatch urlPrefixRegExp
        expect(item.community_icon).toBeTruthy()

      done()

  it '.channel',(done)->
    urlPrefix= 'http://ch.nicovideo.jp/channel/ch'
    urlPrefixRegExp= new RegExp '^'+(escapeRegExp urlPrefix)

    nicovideo.channel query
    .catch done.fail
    .then (result)->
      {total,items}= result

      expect(total).toBeGreaterThan 10
      expect(items.length).toBeGreaterThan 10

      for item in items
        expect(item.title).not.toMatch '&amp;'
        expect(item.tags.join()).not.toMatch '&amp;'
        expect(item.url).toMatch urlPrefixRegExp
        expect(item.thumbnail_url).toBeTruthy()

      done()

  it '.channelarticle',(done)->
    # urlPrefix= 'http://ch.nicovideo.jp/blomaga/'
    # urlPrefixRegExp= new RegExp '^'+(escapeRegExp urlPrefix)

    nicovideo.channelarticle query
    .catch done.fail
    .then (result)->
      {total,items}= result

      expect(total).toBeGreaterThan 400
      expect(items.length).toBe 100

      for item in items
        expect(item.title).not.toMatch '&amp;'
        expect(item.tags?.join()).not.toMatch '&amp;'
        expect(item.url).toBeUndefined()
        expect(item.thumbnail_url).not.toBeUndefined()

      done()

  it '.news',(done)->
    urlPrefix= 'http://news.nicovideo.jp/watch/nw'
    urlPrefixRegExp= new RegExp '^'+(escapeRegExp urlPrefix)

    nicovideo.news query
    .catch done.fail
    .then (result)->
      {total,items}= result

      expect(total).toBeGreaterThan 4000
      expect(items.length).toBe 100

      for item in items
        expect(item.title).not.toMatch '&amp;'
        expect(item.tags?.join()).not.toMatch '&amp;'
        expect(item.url).toMatch urlPrefixRegExp
        expect(item.thumbnail_url).toBeTruthy()

      done()
