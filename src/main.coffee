PIXI = require("pixi.js")
App = require("./App")
Config = require("./data/config")
Stage = require("./data/stage")

app = new App Stage.Width, Stage.Height, {}
app.animation = false
