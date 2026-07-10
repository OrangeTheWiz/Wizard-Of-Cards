

import std/times
import std/random
import std/strutils
import raylib

## typing design inspired by monkeytype

randomize()

var howmanyseconds* = 0.0
var beginninghowmanywordstotype* = 0
var howmanywordstotype* = 0
var wordstotype*: seq[string] = @["", "", ""]
var wordtotype* = wordstotype[0]
var whatyoutyped* = ""
var words* = ["jack", "then", "mine", "rope", "soup", "leg", "rap", "nice", "box", "no", "yes"]
var startingTime* = epochTime()
var TypingStarted* = false
proc Getinput*(): string =
 if isKeyPressed(A):
   return "a"
 if isKeyPressed(B):
   return "b"
 if isKeyPressed(C):
   return "c"
 if isKeyPressed(D):
   return "d"
 if isKeyPressed(E):
   return "e"
 if isKeyPressed(F):
   return "f"
 if isKeyPressed(G):
   return "g"
 if isKeyPressed(H):
   return "h"
 if isKeyPressed(I):
   return "i"
 if isKeyPressed(J):
   return "j"
 if isKeyPressed(K):
   return "k"
 if isKeyPressed(L):
   return "l"
 if isKeyPressed(M):
   return "m"
 if isKeyPressed(N):
   return "n"
 if isKeyPressed(O):
   return "o"
 if isKeyPressed(P):
   return "p"
 if isKeyPressed(Q):
   return "q"
 if isKeyPressed(R):
   return "r"
 if isKeyPressed(S):
   return "s"
 if isKeyPressed(T):
   return "t"
 if isKeyPressed(U):
   return "u"
 if isKeyPressed(V):
   return "v"
 if isKeyPressed(W):
   return "w"
 if isKeyPressed(X):
   return "x"
 if isKeyPressed(Y):
   return "y"
 if isKeyPressed(Z):
   return "z"


wordstotype[0] = sample(words)
doAssert wordstotype[0] in words
wordstotype[1] = sample(words)
doAssert wordstotype[1] in words
wordstotype[2] = sample(words)
doAssert wordstotype[2] in words

proc InitTypingMiniGame*(howmanywords: int, seconds: float) =
      beginninghowmanywordstotype = howmanywords
      howmanywordstotype = howmanywords
      howmanyseconds = seconds
      startingTime = epochTime()
## update typing mini game returns how many words you typed
## whenever the time for typing is up
## or if you typed all the required words
proc UpdateTypingMiniGame*(): int =
      if howmanywordstotype == 0:
        return beginninghowmanywordstotype - howmanywordstotype
      drawRectangle(25, 25, 450, 450, BLACK)
      drawText(wordstotype[0], 150, 200, 25, WHITE)
      drawText(wordstotype[1], 225, 200, 25, WHITE)
      drawText(wordstotype[2], 300, 200, 25, WHITE)
      if whatyoutyped == wordstotype[0]:
        wordstotype[0] = wordstotype[1]
        wordstotype[1] = wordstotype[2]
        wordstotype[2] = sample(words)
        doAssert wordstotype[2] in words
        whatyoutyped = ""
        howmanywordstotype -= 1
      whatyoutyped = whatyoutyped & Getinput()
      if isKeyPressed(Enter):
        wordstotype[0] = wordstotype[1]
        wordstotype[1] = wordstotype[2]
        wordstotype[2] = sample(words)
        doAssert wordstotype[2] in words
        whatyoutyped = ""
      drawText(whatyoutyped, 225, 225, 25, BLUE)
      if (epochTime() - startingTime) >= howmanyseconds:
        ## losing statement
        return (beginninghowmanywordstotype - howmanywordstotype)
       
      else:
       return -1
      drawText("time spent: " & $int(epochTime() - startingTime), 0, 0, 25, RED)



## example implementation
##proc main() =
 ##initWindow(500, 500, "test")
 ##defer: closeWindow()

# setTargetFPS(60)
# InitTypingMiniGame(10, 5.0)

#  while windowShouldClose() == false:
## beginDrawing()
## clearBackground(Orange)
## var value = UpdateTypingMiniGame()
## if value == (-1):
##  discard
## elif value <= 5 and value >= 2:
##  echo "you did ok on the mini game... you get a mid implementation of the card you drew"
## elif value <= 2:
##  echo "oh u did not do good... you get opposite of what the card you drew was going to do"
## elif value >= 8 and value < 10:
##   echo "U DID GREAT U GET A GREAT IMPLEMENTATION OF THE CARD U DREW"
## elif value == 10:
##   echo "10 is the amount of words to type and is max words! you get best implementation of card you drew"
## drawText("time spent: " & $int(epochTime() - startingTime), 0, 0, 25, RED)
## endDrawing()
##main()
