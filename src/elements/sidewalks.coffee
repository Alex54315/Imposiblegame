Stage = require("../data/stage")
class Sidewalks extends PIXI.Graphics
    stage: Stage
    constructor: (x) ->
        super()
        @posX = x
        @posY = 0
        @draw()

    draw: =>
        @beginFill(@stage.sidewalks.color)
        @drawRect(@posX, @posY, @stage.sidewalks.width, @stage.sidewalks.height)
        @endFill()
        

module.exports = Sidewalks