# Dependencies
axios= require 'axios'

querystring= require 'querystring'

# Environment
apiPrefix= 'http://api.ce.nicovideo.jp'
api=
  sessionCreate:
    '/api/v1/session.create'

  sessionAlive:
    '/api/v1/session.alive' # [セッション要]

  userInfo:
    '/api/v1/user.info'

  userPremium:
    '/api/v1/user.premium' # [セッション要]

  achieveSet:
    '/api/v1/achieve.set'

  stepXRanking:
    '/api/v1/step.X.ranking'

  stepXAroundranking:
    '/api/v1/step.X.aroundranking'

  stepXReporter:
    '/api/v1/step.X.reporter'

  stepReportable:
    '/api/v1/step.reportable' # [セッション要]

  communityInfo:
    '/api/v1/community.info'

  communityArray:
    '/api/v1/community.array'

  comunityList:
    '/api/v1/comunity.list' # [セッション要]

  systemUnixtime:
    '/api/v1/system.unixtime'

  blogInfo:
    '/api/v1/blog.info'

  nicoUserMyvideo:
    '/nicoapi/v1/user.myvideo'

  nicoVideoInfo:
    '/nicoapi/v1/video.info'

  nicoVideoArray:
    '/nicoapi/v1/video.array'

  nicoVideoPlay: # [セッション要]
    '/nicoapi/v1/video.play'

  nicoVideoPlaylen: # [?]
    '/nicoapi/v1/video.playlen'

  nicoVideoRelation:
    '/nicoapi/v1/video.relation'

  nicoVideoRanking:
    '/nicoapi/v1/video.ranking'

  nicoVideoSherlock:
    '/nicoapi/v1/video.sherlock'

  nicoVideoCeselected:
    '/nicoapi/v1/video.ceselected'

  nicoWiiuRanking:
    '/nicoapi/v1/wiiu.ranking'

  nicoWiiuTrendytag:
    '/nicoapi/v1/wiiu.trendytag'

  nicoMylistgroupGet:
    '/nicoapi/v1/mylistgroup.get'

  nicoDeflistList:
    '/nicoapi/v1/deflist.list'

  nicoDeflistAdd: # [セッション要]
    '/nicoapi/v1/deflist.add'

  nicoMylistList:
    '/nicoapi/v1/mylist.list'

  nicoMylistAdd: # [セッション要]
    '/nicoapi/v1/mylist.add'

  nicoMylistSearch:
    '/nicoapi/v1/mylist.search'

  nicoVideoChannelrecentvideo:
    '/nicoapi/v1/video.channelrecentvideo'

  nicoVideoChannelselected:
    '/nicoapi/v1/video.channelselected'

  nicoVideoSearch:
    '/nicoapi/v1/video.search'

  nicoTagSearch:
    '/nicoapi/v1/tag.search'

  nicoGenreList: # group: 1 を付けるとグループ カテゴリー読み込み
    '/nicoapi/v1/genre.list'

  liveInfo:
    '/liveapi/v1/video.info'

  liveArray:
    '/liveapi/v1/video.array'

  livePlay: # [セッション要]
    '/liveapi/v1/video.play'

  liveOnairlist:
    '/liveapi/v1/video.onairlist'

  liveComingsoon:
    '/liveapi/v1/video.comingsoon'

  liveSearchSolr:
    '/liveapi/v1/video.search.solr'

  liveUserSubscribe: # [セッション要]
    '/liveapi/v1/user.subscribe'

# Public
class Vita
  vitaApi: api
  vita: (api,params={},options={})->
    throw new TypeError 'params is not an object' if typeof params isnt 'object'
    uri= apiPrefix+@vitaApi[api]
    params.__format?= 'json'

    axios.get uri+'?'+(querystring.stringify params),options
    .then (response)->
      response.data

module.exports= new Vita
module.exports.Vita= Vita
