# Dependencies
nicovideo= require '../src'

describe '.tag',->
  it '.videoTag',(done)->
    nicovideo.videoTag()
    .catch done.fail
    .then (result)->
      {total,items}= result

      expect(total).toBeGreaterThan 1500000
      expect(items.length).toBe 100

      for item in items
        expect(item.tag).not.toMatch '&amp;'

      done()

  it '.illustTag',(done)->
    nicovideo.illustTag()
    .catch done.fail
    .then (result)->
      {total,items}= result

      expect(total).toBeGreaterThan 190000
      expect(items.length).toBe 100

      for item in items
        expect(item.tag).not.toMatch '&amp;'

      done()

  it '.mangaTag',(done)->
    nicovideo.mangaTag()
    .catch done.fail
    .then (result)->
      {total,items}= result

      expect(total).toBeGreaterThan 7900
      expect(items.length).toBe 100

      for item in items
        expect(item.tag).not.toMatch '&amp;'

      done()

  it '.bookTag',(done)->
    nicovideo.bookTag()
    .catch done.fail
    .then (result)->
      {total,items}= result

      expect(total).toBeGreaterThan 23000
      expect(items.length).toBe 100

      for item in items
        expect(item.tag).not.toMatch '&amp;'

      done()

  it '.liveTag',(done)->
    nicovideo.liveTag()
    .catch done.fail
    .then (result)->
      {total,items}= result

      expect(total).toBeGreaterThan 130000
      expect(items.length).toBe 100

      for item in items
        expect(item.tag).not.toMatch '&amp;'

      done()

  it '.channelTag',(done)->
    nicovideo.channelTag()
    .catch done.fail
    .then (result)->
      {total,items}= result

      expect(total).toBeGreaterThan 6000
      expect(items.length).toBe 100

      for item in items
        expect(item.tag).not.toMatch '&amp;'

      done()

  it '.channelarticleTag',(done)->
    nicovideo.channelarticleTag()
    .catch done.fail
    .then (result)->
      {total,items}= result

      expect(total).toBeGreaterThan 15000
      expect(items.length).toBe 100

      for item in items
        expect(item.tag).not.toMatch '&amp;'

      done()

  it '.newsTag',(done)->
    nicovideo.newsTag()
    .catch done.fail
    .then (result)->
      {total,items}= result

      expect(total).toBeGreaterThan 34000
      expect(items.length).toBe 100

      for item in items
        expect(item.tag).not.toMatch '&amp;'

      done()
