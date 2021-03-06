# Description:
#   Very basic script for response testing
#
# Dependencies:
#   N/A
#
# Configuration:
#   N/A
#
# Commands:
#   hubot ping - responds with pong
#
# Author:
#   timkinnane
#

module.exports = (robot) ->

  # talk when talked to
  robot.respond /ping/, (res) -> res.reply 'pong'

  # let tests listen for response objects
  robot.receiveMiddleware (context, next, done) ->
    robot.emit 'receive', context.response
    next()
  robot.responseMiddleware (context, next, done) ->
    robot.emit 'respond', context.response
    next()
