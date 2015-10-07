# Dependencies
nicovideo= require '../src'

describe '.search',->
  query= '初音ミク'

  it '.video',(done)->
    nicovideo.video query
    .catch done.fail
    .then (result)->
      {total,items}= result

      expect(total).toBeGreaterThan 225000
      expect(items.length).toBe 100

      for item in items
        expect(item.title).not.toMatch '&amp;'
        expect(item.tags.join()).not.toMatch '&amp;'

      done()

  it '.illust',(done)->
    nicovideo.illust query
    .catch done.fail
    .then (result)->
      {total,items}= result

      expect(total).toBeGreaterThan 77000
      expect(items.length).toBe 100

      for item in items
        expect(item.title).not.toMatch '&amp;'
        expect(item.tags.join()).not.toMatch '&amp;'

      done()

  it '.manga',(done)->
    nicovideo.manga query
    .catch done.fail
    .then (result)->
      {total,items}= result

      expect(total).toBeGreaterThan 100
      expect(items.length).toBe 100

      for item in items
        expect(item.title).not.toMatch '&amp;'
        expect(item.tags.join()).not.toMatch '&amp;'

      done()

  it '.book',(done)->
    nicovideo.book query
    .catch done.fail
    .then (result)->
      {total,items}= result

      expect(total).toBeGreaterThan 10
      expect(items.length).toBeGreaterThan 10

      for item in items
        expect(item.title).not.toMatch '&amp;'
        expect(item.tags.join()).not.toMatch '&amp;'

      done()

  it '.live',(done)->
    nicovideo.live query
    .catch done.fail
    .then (result)->
      {total,items}= result

      expect(total).toBeGreaterThan 1500
      expect(items.length).toBe 100

      for item in items
        expect(item.title).not.toMatch '&amp;'
        expect(item.tags.join()).not.toMatch '&amp;'

      done()

  it '.channel',(done)->
    nicovideo.channel query
    .catch done.fail
    .then (result)->
      {total,items}= result

      expect(total).toBeGreaterThan 10
      expect(items.length).toBeGreaterThan 10

      for item in items
        expect(item.title).not.toMatch '&amp;'
        expect(item.tags.join()).not.toMatch '&amp;'

      done()

  it '.channelarticle',(done)->
    nicovideo.channelarticle query
    .catch done.fail
    .then (result)->
      {total,items}= result

      expect(total).toBeGreaterThan 400
      expect(items.length).toBe 100

      for item in items
        expect(item.title).not.toMatch '&amp;'
        expect(item.tags?.join()).not.toMatch '&amp;'

      done()

  it '.news',(done)->
    nicovideo.news query
    .catch done.fail
    .then (result)->
      {total,items}= result

      expect(total).toBeGreaterThan 4000
      expect(items.length).toBe 100

      for item in items
        expect(item.title).not.toMatch '&amp;'
        expect(item.tags?.join()).not.toMatch '&amp;'

      done()
