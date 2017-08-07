# CoD4X Trueskill plugin
A game rating system made available to use as CoD4X plugin

## Copyright notice
Trueskill algorithm code in this plugin is a port of [sublee/trueskill](https://github.com/sublee/trueskill) from python to C++. For more information consult [LICENSE_ORIGINAL](https://github.com/leiizko/cod4x_trueskill/blob/master/LICENSE_ORIGINAL). 

All C++ code is released under AGPL-v3.

## Added functions
```
* TS_Rate( <number of teams>, <team rankings> )
  - <number of teams>: Integer, number of teams in game, each player counts as a team in FFA mode
  - <team rankings>: String, team placements separated by space. Lower number is better, same numbers is a tie. 
  Needs to be in a specfic order, the string gets tokenized into an array. Array index+1 represents a team. Example:
  TS_Rate( 2, "0 1" ) - Number of teams is 2, Axis is 1, Allies is 2: Axis wins the round, Allies lose.
  TS_Rate( 5, "2 0 0 1 3" ) - FFA mode, 5 players. Player 1 is third, players 2 and 3 are tied at first place,
  player 4 is second and player 5 is fourth.
  Returns array of updated MEAN(mu) and VARIANCE(sigma) values in the same order as added by TS_AddPlayer.
  Arr[ i ][ 0 ] = MEAN(mu)
  Arr[ i ][ 1 ] = VARIANCE(sigma)
  Clears all players added by TS_AddPlayer function.
  
* TS_Quality( <number of teams> )
  - <number of teams>: Integer, number of teams in game, each player counts as a team in FFA mode
  Returns a float of game quality ( 0 - 1 ). Multiply by 100 to get percentage of draw chance
  Clears all players added by TS_AddPlayer function.
  
* TS_AddPlayer( <player ID>, <player mu>, <player sigma>, <player team>, [<player weight>] )
  - <player ID> - Integer, slot number
  - <player mu> - Float, mean rating of a player
  - <player sigma> - Float, variance rating of a player
  - <player team> - Integer, team of a player, start at 1, in FFA each player is a team, example:
  TDM mode, Allies = 1, Axis = 2
  FFA mode, player 1 = 1, player 2 = 2, player 3 = 3, etc..
  - [<player weight>], OPTIONAL, Float, weight for the player, defaults to 1.
  
* TS_ClearAllPlayers()
  Clears all players added by TS_AddPlayer function.
  
* TS_UpdateMu( <new mu> )
  - <new mu> - Float, updates the default rating values. New players must start at this mean value, sigma is MU/3
  
* TS_UpdateDraw( <new_draw> )
  - <new_draw> - Float, 0 - 1, updates the default draw chance (0.1)
```

