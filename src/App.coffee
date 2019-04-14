Sidewalk = require("./elements/sidewalks")
Roadlines = require("./elements/Roadlines")
Badcars = require("./elements/Badcars")
Circle = require("./elements/Circle")
Car = require("./elements/Car")
Carro = require("./assets/Carro.json")
Badcarro = require("./assets/Badcarro.json")
math = require "mathjs"
img = require("./assets/LSidewalk.png")
img2 = require("./assets/RSidewalk.png")
img3 = require("./assets/Win.png")
img4 = require("./assets/Lose.png")
img5 = require("./assets/BadCarro.gif")

class App extends PIXI.Application
  animation: true
  animationNodes: []
  # Lines: []
  Bads: []
  Speed: 1
  Derecha: false
  Izquierda: false
  # Intervalline: 2500
  Intervalo: 5000
  constructor: (w, h, o) ->
    super(w, h, o)
    document.body.appendChild @view
    window.addEventListener 'keydown', @onKeydown
    window.addEventListener 'keyup', @onKeyUp
    @build()
    @animate()
    if @Speed < 35
      console.log @Speed
      # clearInterval(@interval)
    PIXI.loader.add(Carro).load(@car.build)

  
  onKeyUp: (e) =>
    if e.key is 'a'
      @Izquierda = false
    if  e.key is 'd'
      @Derecha = false

  onKeydown: (e) =>
    if e.key is 'a'
      @Izquierda = true
    if  e.key is 'd'
      @Derecha = true

  Win: =>
    @winner = new PIXI.Sprite.from("./assets/Win.png")
    @winner.x = 725
    @winner.y = 200
    @stage.addChild @winner

  Lose: =>
    @loser = new PIXI.Sprite.from("./assets/Lose.png")
    @loser.x = 725
    @loser.y = 200
    @stage.addChild @loser

  build: =>
    # console.log img
    # console.log img2
    # console.log img3
    # console.log img4
    @Lsidewalk = new Sidewalk(0)
    @Lsidewalk.x = 600
    @stage.addChild @Lsidewalk

    @Rsidewalk = new Sidewalk(0)
    @Rsidewalk.x = 1300
    @stage.addChild @Rsidewalk

    @car = new Car(@)

    @LSide = new PIXI.Sprite.from("./assets/LSidewalk.png")
    @LSide.x = 0
    @stage.addChild(@LSide)

    @RSide = new PIXI.Sprite.from("./assets/RSidewalk.png")
    @RSide.x = 1300
    @stage.addChild(@RSide)

    @interval = setInterval =>
      @badcar = new Badcars(@, img5)
    , 5000

  garbageCollector: (item) =>

    badcarChild = @Bads.indexOf(item)
    if(badcarChild > -1)
      @Bads.splice(badcarChild, 1)

    animationChild = @animationNodes.indexOf(item)
    if (animationChild > -1)
      @animationNodes.splice(animationChild, 1)

    stageChild = @stage.children.indexOf(item)
    if (stageChild > -1)
      @stage.children.splice(stageChild, 1)

  collisionBad: (obj1, list) ->
    for n in list
      if (obj1.x < n.x + n.width && obj1.x + obj1.width > n.x && obj1.y < n.y + n.height && obj1.y + obj1.height > n.y)
        obj1.alpha = 0
        clearInterval(@interval)
        @Lose()

  addAnimationNodes:(child)=>
    @animationNodes.push child
    null

  animate:=>
    @ticker.add ()=>
      if @Speed > 29
        clearInterval(@interval)
        @Win()
      if @Derecha is true
        @car.speed += 1 
      if @Izquierda is true
        @car.speed -= 1
      @collisionBad(@car.prota, @Bads)
      for n in @animationNodes
        return unless n
        n.animate?()

    null

module.exports = App
