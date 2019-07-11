# NFL_Data
Summarizing NFL data by breakpoints

This function uses the NFLSCRAPR database as the source of all data statistics and as the source for play by play breakdown.

The function has thw following inputs:

  team
    - This should be set to the team abbreviation used by NFLScrapr (e.g. BAL)
    
  year (default 2018)
    - This allows the user to select what year is of interest.
   
  off_def (default "off")
    - This allows the user to select if they are interested in the team's offensive stats or defensive stats
    - For defensive stats, the value should be "def".
    
  play_type (default - "run")
    - This allows the user to review a subset of data based on a given play type.
    - The primary values are "run" and "pass".
    
  data_field (default = yards_gained)
    - This allows the user to select what data field the data should be show the sum of.
    - Some other options include: EPA, WPA
    
  break_field (default= "rusher_player_name")
    - This allows the user to select what they would like the data to be split based on.
    - This can use any field in the NFLScraper database that has a finite number of options.
