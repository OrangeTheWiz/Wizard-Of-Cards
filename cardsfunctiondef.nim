import cardengine
import ../typingmodule/typingmodule as typingm
import raylib

## and its indexes for the init and update functions are also at index 0
## due to the way it was setup
##Preparecard(HandAndDeck[0])



## index 0 at init function sequence and update function sequences mean the fire card
## index 1 means the blank card
##proc DrawCard(SomeCard: card, x: int, y: int) =
 ##drawTexture(Sprites[SomeCard.CardIndexAtSprites], x.int32(), y.int32(), WHITE)

proc InitFireCard() =
 InitTypingMiniGame(7, 15.0)


proc UpdateFireCard() =
 var ValueOfTyped = UpdateTypingMiniGame()
 if ValueOfTyped == (-1):
   discard
 elif ValueOfTyped == 1:
   echo "replace this with your hp minus 7"
   checkingfortyping = false
   typingactivated = false
   InATypingMiniGame = false
 elif ValueOfTyped > 2 and ValueOfTyped < 5:
   echo "replace this with enemy hp minus 5"
   checkingfortyping = false
   typingactivated = false
   InATypingMiniGame = false
 elif ValueOfTyped == 5:
  echo "replace this with enemy hp minus 7"
  checkingfortyping = false
  typingactivated = false
  InATypingMiniGame = false
 elif ValueOfTyped > 5 and ValueOfTyped < 7:
  echo "replace this with enemy hp minus 10"
  checkingfortyping = false
  typingactivated = false
  InATypingMiniGame = false
 elif ValueOfTyped >= 7:
  echo "replace this with enemy hp minus 13"
  checkingfortyping = false
  typingactivated = false
  InATypingMiniGame = false
 elif ValueOfTyped == 0:
  echo "ummmmmmmmm"
  checkingfortyping = false
  typingactivated = false
  InATypingMiniGame = false

proc initBlankCard() =
 discard

proc UpdateBlankCard() =
 checkingfortyping = false
 typingactivated = false
 InATypingMiniGame = false


## card index 0 fire
InitTypingGameFunctions.add(InitFireCard)
UpdateTypingGameFunctions.add(UpdateFireCard)

## card index 1 blank
InitTypingGameFunctions.add(initBlankCard)
UpdateTypingGameFunctions.add(UpdateBlankCard)


##proc InitTextures*() =
 ##Sprites.add(loadTexture("cardgraphics/firecard.png"))


var BlankCard = card(CardIndexAtInitTypingGameFuncs: 1, CardIndexAtUpdateTypingGameFuncs: 1, CardIndexAtSprites: 1)
for i in 0..7:
    HandAndDeck.add(BlankCard)
    var FireCard = card(CardIndexAtInitTypingGameFuncs: 0, CardIndexAtUpdateTypingGameFuncs: 0)
    HandAndDeck[0] = FireCard
    AvailableCards.add(FireCard)
## remove this prepare card function later it is just a test for now.
Preparecard(HandAndDeck[0])
