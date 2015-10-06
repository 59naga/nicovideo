# Dependencies
nicovideo= require '../src'

# Environment
jasmine.DEFAULT_TIMEOUT_INTERVAL= 5000

# Specs
describe 'nicovideo',->
  describe '.search',->
    it '.video',(done)->
      nicovideo.video '初音ミク'
      .catch done.fail
      .then (result)->
        {total,items}= result

        expect(total).toBeGreaterThan 225000
        expect(items.length).toBe 100

        done()

    it '.illust',(done)->
      nicovideo.illust '初音ミク'
      .catch done.fail
      .then (result)->
        {total,items}= result

        expect(total).toBeGreaterThan 77000
        expect(items.length).toBe 100

        done()

    it '.manga',(done)->
      nicovideo.manga '初音ミク'
      .catch done.fail
      .then (result)->
        {total,items}= result

        expect(total).toBeGreaterThan 100
        expect(items.length).toBe 100

        done()

    it '.book',(done)->
      nicovideo.book '初音ミク'
      .catch done.fail
      .then (result)->
        {total,items}= result

        expect(total).toBeGreaterThan 10
        expect(items.length).toBeGreaterThan 10

        done()

    it '.live',(done)->
      nicovideo.live '初音ミク'
      .catch done.fail
      .then (result)->
        {total,items}= result

        expect(total).toBeGreaterThan 1500
        expect(items.length).toBe 100

        done()

    it '.channel',(done)->
      nicovideo.channel '初音ミク'
      .catch done.fail
      .then (result)->
        {total,items}= result

        expect(total).toBeGreaterThan 10
        expect(items.length).toBeGreaterThan 10

        done()

    it '.channelarticle',(done)->
      nicovideo.channelarticle '初音ミク'
      .catch done.fail
      .then (result)->
        {total,items}= result

        expect(total).toBeGreaterThan 400
        expect(items.length).toBe 100

        done()

    it '.news',(done)->
      nicovideo.news '初音ミク'
      .catch done.fail
      .then (result)->
        {total,items}= result

        expect(total).toBeGreaterThan 4000
        expect(items.length).toBe 100

        done()

  describe '.tag',->
    it '.videoTag',(done)->
      nicovideo.videoTag()
      .catch done.fail
      .then (result)->
        {total,items}= result

        expect(total).toBeGreaterThan 1500000
        expect(items.length).toBe 100

        done()

    it '.illustTag',(done)->
      nicovideo.illustTag()
      .catch done.fail
      .then (result)->
        {total,items}= result

        expect(total).toBeGreaterThan 190000
        expect(items.length).toBe 100

        done()

    it '.mangaTag',(done)->
      nicovideo.mangaTag()
      .catch done.fail
      .then (result)->
        {total,items}= result

        expect(total).toBeGreaterThan 7900
        expect(items.length).toBe 100

        done()

    it '.bookTag',(done)->
      nicovideo.bookTag()
      .catch done.fail
      .then (result)->
        {total,items}= result

        expect(total).toBeGreaterThan 23000
        expect(items.length).toBe 100

        done()

    it '.liveTag',(done)->
      nicovideo.liveTag()
      .catch done.fail
      .then (result)->
        {total,items}= result

        expect(total).toBeGreaterThan 130000
        expect(items.length).toBe 100

        done()

    it '.channelTag',(done)->
      nicovideo.channelTag()
      .catch done.fail
      .then (result)->
        {total,items}= result

        expect(total).toBeGreaterThan 6000
        expect(items.length).toBe 100

        done()

    it '.channelarticleTag',(done)->
      nicovideo.channelarticleTag()
      .catch done.fail
      .then (result)->
        {total,items}= result

        expect(total).toBeGreaterThan 15500
        expect(items.length).toBe 100

        done()

    it '.newsTag',(done)->
      nicovideo.newsTag()
      .catch done.fail
      .then (result)->
        {total,items}= result

        expect(total).toBeGreaterThan 34000
        expect(items.length).toBe 100

        done()
