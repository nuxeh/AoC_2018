let doc = """
Advent of code 2018, day 9

Usage:
  day{} [options] [<input>]

Options:
  -h --help          Show this help message.
  -v --verbose       Show extra information.
  -t=<n> --test=<n>  Use test data
"""

import strutils
import docopt
import lists

type
  spec = tuple [
    players: int,
    last_score: int
  ]

var
  tests = newSeq[spec]()
  game: spec

tests.add((9, 25))
tests.add((10, 1618))
tests.add((13, 7999))
tests.add((17, 1104))
tests.add((21, 6111))
tests.add((30, 5807))

let args = docopt(doc, version = "0.1.0")

if not args["--test"]:
  game.players = 419
  game.last_score = 72164
else:
  var t = parseInt($args["--test"])
  if t < len(tests):
    game = tests[t]
  else:
    echo "invalid test"
    quit(1)

echo $game

var
  current_marble = 0
  current_player = 0
  table = initDoublyLinkedRing[int]()

table.prepend(current_marble)
echo $table

while current_marble < game.last_score:
