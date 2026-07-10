import raylib

var WhereInInitTypingGameFuncsToExecute = 0

var WhereInUpdateTypingGameFuncsToExecute = 0


var InATypingMiniGame*: bool

InATypingMiniGame = true

var InitTypingGameFunctions*: seq[proc()] = @[]

var UpdateTypingGameFunctions*: seq[proc()] = @[]
var checkingfortyping* = false
var typingactivated* = false

## also where any instance of card is in your hand does not matter what matters is the card instance's variable value
## because that dictates what type of card it is and what functions get ran whenever you call Preparecard on that card instance.
type card* = ref object
 CardIndexAtInitTypingGameFuncs*: int
 CardIndexAtUpdateTypingGameFuncs*: int
 CardIndexAtSprites*: int


var HandAndDeck*: seq[card] = @[]
var AvailableCards*: seq[card] = @[]
##var Sprites*: seq[Texture2D] = @[]

## prepare card will setup execution of a card in a certain index of your hand/deck you can call it like this
## Preparecard(HandAndDeck[0])
## where 0 refers to your current configuration of your hand
proc Preparecard*(Acard: card) =

 WhereInInitTypingGameFuncsToExecute = Acard.CardIndexAtInitTypingGameFuncs

 WhereInUpdateTypingGameFuncsToExecute = Acard.CardIndexAtUpdateTypingGameFuncs
 checkingfortyping = true
 typingactivated = true
 InATypingMiniGame = true




## for this thing you must make it so that  checkingfortyping is equal to true
## and typing activated variables are equal to true and then set WhereInInitTypingGameFuncsToExecute
## and WhereInUpdateTypingGameFuncsToExecute to the appropriate indexes for the card
## you are trying to execute
## also set in a typing game to true
proc MainCardsUpdate*() =
 if checkingfortyping == true:
   if typingactivated == true:
    InitTypingGameFunctions[WhereInInitTypingGameFuncsToExecute]()
   checkingfortyping = false
 else:
   if typingactivated == true:
    UpdateTypingGameFunctions[WhereInUpdateTypingGameFuncsToExecute]()



