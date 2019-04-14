Carro = require("../assets/Carro.json")
class Car extends PIXI.Graphics
    speed: null
    constructor: (app) ->
        super()
        @posX = window.innerWidth/2
        @posY = 750
        @app = app
        # PIXI.loader.add(Carro).load(@build)

    build: =>
        frame = []
        for i in [0..4] by 1
            node = PIXI.Texture.fromFrame("Carro#{i}.png")
            frame.push(node)
        
        @prota =  new PIXI.extras.AnimatedSprite(frame)
        @prota.x = @posX
        @prota.y = @posY
        @prota.animationSpeed = 0.1
        @prota.play()
        @app.stage.addChild(@prota)
        @app.addAnimationNodes(@)

    animate: =>
        @x += @speed
        @prota.x = @x
        if @speed > 0
            @speed -= 0.5
        if @speed < 0
            @speed += 0.5

        if @x <= 640
            @x = 640
            @speed = 0
        if @x + 100 >= 1300
            @x = 1300 - 100
            @speed = 0

module.exports = Car