import raylib
import std/random

randomize()

var IsItTheEnemiesTurn = false
var enemysprites: seq[Texture2D] = @[]



type enemy* = ref object
 WhereInSpriteSeq: int
 EnemyHp: int

proc InitEnemy(E: var enemy) =
 ## the second 0 in both of the 0..0 is the max size of enemysprites be sure to update ## it
 E.WhereInSpriteSeq = rand(0..0)
 doAssert E.WhereInSpriteSeq in 0..0
 E.EnemyHp = rand(0..100)

var Enemy = enemy(WhereInSpriteSeq: 0, EnemyHp: 0)
InitEnemy(Enemy)

var enemyattacks: seq[proc()] = @[]
var attackstrength = 0


proc Attack() =
   attackstrength = rand(1..30)
   doAssert attackstrength in 1..30
   echo "replace this with player hp minus ", attackstrength


proc MakeEnemy() =
 InitEnemy(Enemy)

proc MainEnemyUpdate() =
 drawTexture(enemysprites[Enemy.WhereInSpriteSeq], 350, 200, WHITE)
 drawText($Enemy.EnemyHp, 400, 190, 25, WHITE)

proc main() =
   initWindow(500, 500, "BURGER")
   defer: closeWindow()
   enemysprites.add(loadTexture("./enemygraphics/bob.png"))
   setTargetFPS(60)

   while windowShouldClose() == false:
       beginDrawing()
       clearBackground(BLACK)
       if isKeyPressed(Space):
        echo Enemy.WhereInSpriteSeq
        echo Enemy.EnemyHp
       if isKeyPressed(N):
        MakeEnemy()
       if isKeyPressed(A):
        Attack()
       MainEnemyUpdate()
       endDrawing()
main()
