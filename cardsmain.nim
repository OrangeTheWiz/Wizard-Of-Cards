
import raylib

import cardengine

import cardsfunctiondef

var Inited = false



proc main() =
 initWindow(500, 500, "test")
 defer: closeWindow()
 setTargetFPS(60)
 var Sprites: seq[Texture2D] = @[]
 proc InitTextures() =
  Sprites.add(loadTexture("cardgraphics/firecard.png"))


 proc DrawCard(SomeCard: card, x: int, y: int) =
  drawTexture(Sprites[SomeCard.CardIndexAtSprites], x.int32(), y.int32(), WHITE)











 InitTextures()
 while windowShouldClose() == false:   
  beginDrawing()
  clearBackground(BLACK)
  ## TODO implement sprite sheet system for loading sprites because this seg faults when you close the window
  MainCardsUpdate()
  endDrawing()
main()
