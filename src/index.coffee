# Dependencies
require('es6-promise').polyfill()

search= require './search'
tag= require './tag'

# Public
class Nicovideo
  for key,value of Object.getPrototypeOf search
    @prototype[key]= value

  for key,value of Object.getPrototypeOf tag
    @prototype[key]= value

module.exports= new Nicovideo
module.exports.Nicovideo= Nicovideo
