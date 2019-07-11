nfl_data <-function(team, year=2018, off_def = "off", play_type = "run", data_field = "yards_gained", break_field = "rusher_player_name") {

  library(nflscrapR)
  library(tidyverse)
  library(tidyr)
    
  ##function to summarize run play data for a given team
  pbp_summary <- function(gameid, off_def1 = off_def, play_type1 = play_type, data_field1 = data_field, break_field1 = break_field) {
    pbp <- scrape_json_play_by_play(gameid)
     if (off_def1 == "off") {
        selection <- pbp[["play_type"]]==play_type1 & pbp[["defteam"]] != team
    } else if (off_def1 == "def") { selection <- pbp[["play_type"]]==play_type1 & pbp[["defteam"]] == team
    } else {selection <- pbp[["play_type"]]==play_type1}
    selection_clean <- replace_na(selection, FALSE)
    select_play_pbp <- pbp[selection_clean, ]
    game_output <- tapply(select_play_pbp[[data_field1]], select_play_pbp[[break_field1]], sum)
    game_output
    }
  
  gameinfo <- scrape_game_ids(year, teams = team)
  full_output <- lapply(as.array(gameinfo$game_id), pbp_summary)  
  full_output
}