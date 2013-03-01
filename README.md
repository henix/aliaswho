# aliaswho

Analyze your bash\_history to find which cmd should be defined as alias to save keystrokes maximally.

## Theory

For example, if `git status` occurs 75 times in your .bash\_history, and if you define `alias gst='git status'`. Then each time you type `gst` will save 7 keystrokes. The expectation of keystroke save will be 7 * 75 = 525 for each 500 commands.

## Build

aliaswho need `ghc` to build.

	ghc aliaswho.hs

This will generate executable `aliaswho`.

## Usage

	./aliaswho < ~/.bash_history

aliaswho will sort all command prefix by "times it occurs * length of the command". There are 2 columns in output, first is times a command occurs, second is the command itself.
