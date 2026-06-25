

import raylib
var x = 250.0
var y = 250.0
var oldx = x
var oldy = y
type tile = ref object
 x: int
 y: int

var tiles: seq[tile] = @[]

proc inittiles() =
 for x in countup(-275, 1500, 64):
   for y in countup(-265, 1500, 64):
     var TileInstance = tile(x: x, y: y)
     tiles.add(TileInstance)
 for tile in tiles:
   tile.y += 20
proc main() =
 inittiles()
 initWindow(500, 500, "Isometric test")
 var ground = loadTexture("../graphics/test.png")
 defer:
     closeWindow()
 setTargetFPS(144)


 while windowShouldClose() == false:

    beginDrawing()
    clearBackground(BLACK)
    oldx = x
    oldy = y
    var playerrect = Rectangle(x: x, y: y, width: 50, height: 50)
    if isKeyDown(Up):
      y -= 500 * getFrameTime()
    if isKeyDown(Down):
      y += 500 * getFrameTime()
    if isKeyDown(Left):
      x -= 500 * getFrameTime()
    if isKeyDown(Right):
      x += 500 * getFrameTime()
    if isKeyPressed(Space):
      echo x
      echo y
    for i in tiles:
      drawTexture(ground, 250 + (i.x.int32() / 2).int32 - (i.y.int32() / 2).int32,(i.y.int32() / 5).int32 + (i.x.int32() / 5).int32, WHITE)
      var tilerect = Rectangle(x: i.x.toFloat, y: i.y.toFloat, width: 50, height: 50)


    drawTexture(ground, x.int32(), y.int32(), WHITE)
    drawText($getFps(), 0, 0, 25, WHITE)
    endDrawing()



main()
