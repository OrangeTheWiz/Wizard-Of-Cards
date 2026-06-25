# Wizard-Of-Cards

### This is an isometric game where you wait for enemies and cards to spawn.
### Build a small deck of cards and swap them out as you please.
### Fight bosses every now and then.
### Execute spells from cards with your keyboard, which adds a level of required skill to the game.

## Playing the game
### Wizard-Of-Cards does not have binaries or appimages in the releases section of this repository, however, you can build the game yourself.

## Building
### You will need the nim programming language, a binding of the raylib game library that the game uses called naylib, and of course, the game's source code and assets.

### Create a directory or folder called Wizard-Of-Cards and cd into it.
#### You can simply copy and paste this command.
#### mkdir Wizard-Of-Cards && cd Wizard-Of-Cards

### Next, you must either clone the games repository once you are inside of the directory, or, download the game's source code and assets directly from the github website.
### If you can use git from the command line, and want to use git instead of manually downloading the zip, you can copy and paste this command.
#### git clone https://github.com/OrangeTheWiz/Wizard-Of-Cards/
### If you downloaded the game with the git command from above can skip to Finilizing Build.
### You can download the game's source and assets by clicking the green code button in the top right area of the Wizard-Of-Cards repository.
### Then you must unzip the games code, optionally delete the zip, and finally, put the folder you got from unzipping the zip into the Wizard-Of-Cards directory from earlier.

## Finilizing Build
### At this point, you will be in a directory called Wizard-Of-Cards and will have a directory inside of Wizard-Of-Cards also called Wizard-Of-Cards.
### cd into that directory with this command.
### cd Wizard-Of-Cards
### By now, you should have naylib installed to be able to build the game.
### To install naylib copy and paste this command
#### nimble install naylib
### If you could not install nimble or if more build instructions below did not work, try this command.
#### nimble install raylib
### Now you should be able to build the game by running these two commands.
#### cd src
#### nim c -d:release main.nim
### It will most likely take a little while to build, just be patient.
