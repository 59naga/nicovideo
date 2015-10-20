# Dependencies
nicovideo= require '../src'

describe 'issues',->
  query= 'さよならを教えて'

  it '#2',(done)->
    nicovideo.video query,{from:200}
    .catch done.fail
    .then (result)->
      {items}= result

      for item in items
        expect(item.thumbnail_url).toMatch /tn-skr.\.smilevideo.jp\/smile\?i=\d+?$/

      done()
