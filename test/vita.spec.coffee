# Dependencies
nicovideo= require '../src'

describe '.vita (Only node.js)',->
  return if window?
  it 'liveInfo',(done)->
    nicovideo.vita 'liveInfo',{v:'lv237721545'}
    .catch done.fail
    .then (result)->
      thumbnail= result.nicolive_video_response.video_info.community.thumbnail
      expect(thumbnail).toMatch '\/168\/co1687166.jpg'
      done()
