Stage = require("../data/stage")
math = require "mathjs"
class Badcars extends PIXI.Graphics
    stage: Stage
    constructor: (app, image) ->
        super()
        @app = app
        @image = image
        @draw()

    draw: =>
        @carro = new PIXI.Sprite.from(@image)
        @carro.x = math.randomInt(640, 1180)
        @carro.y = -200
        @app.stage.addChild(@carro)
        @app.Bads.push @carro
        @app.addAnimationNodes(@)

    animate: =>
        @carro.y += @app.Speed
        if @carro.y >= window.innerHeight
            @app.garbageCollector(@)
            @app.Speed += 1
            @app.Intervalo -= 100
            console.log @app.Speed
            if @app.Intervalo <= 200
                @app.Intervalo     = 200


module.exports = Badcars