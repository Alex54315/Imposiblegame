Stage = require("../data/stage")
class Roadlines extends PIXI.Graphics
    stage: Stage
    constructor: (x, y, app) ->
        super()
        @posX = x
        @posY = y
        @app = app
        @draw()

    draw: =>
        @beginFill(@stage.roadlines.color)
        @drawRect(@posX, @posY, @stage.roadlines.width, @stage.roadlines.height)
        @endFill()

    animate: =>
        @y += @app.Speed
        if @y >= window.innerHeight
            @app.garbageCollector(@)

module.exports = Roadlines