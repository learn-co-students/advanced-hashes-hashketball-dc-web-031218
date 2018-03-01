# Write your code here!
def game_hash
  the_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end



def num_points_scored(player_name)

  #returns :points  for player name
  nets_roster = game_hash[:home][:players]
  hornets_roster = game_hash[:away][:players]

  nets_roster.each_key do |player|
    if player == player_name
      return game_hash[:home][:players][player][:points]
    end
  end

  hornets_roster.each_key do |player|
    if player == player_name
      return game_hash[:away][:players][player][:points]
    end
  end

end

def shoe_size(player_name)
  nets_roster = game_hash[:home][:players]
  hornets_roster = game_hash[:away][:players]

  nets_roster.each_key do |player|
    if player == player_name
      return game_hash[:home][:players][player][:shoe]
    end
  end

  hornets_roster.each_key do |player|
    if player == player_name
      return game_hash[:away][:players][player][:shoe]
    end
  end
end


def team_colors(team_name)
  nets_team_name = game_hash[:home][:team_name]
  hornets_team_name = game_hash[:away][:team_name]

  if team_name == nets_team_name
    return game_hash[:home][:colors]
  elsif team_name == hornets_team_name
    return game_hash[:away][:colors]
  end
end

def team_names
  nets_team_name = game_hash[:home][:team_name]
  hornets_team_name = game_hash[:away][:team_name]
  team_names_array = [nets_team_name, hornets_team_name]
end

def player_numbers(team_name)
  # that takes in an argument of a team name and returns an array of the jersey number's for that team.
  nets_team_name = game_hash[:home][:team_name]
  hornets_team_name = game_hash[:away][:team_name]

  nets_roster = game_hash[:home][:players]
  hornets_roster = game_hash[:away][:players]

  nets_players_numbers = []
  hornets_players_numbers = []

  nets_roster.each_key do |player_name|
    nets_players_numbers.push(game_hash[:home][:players][player_name][:number])
  end

  hornets_roster.each_key do |player_name|
    hornets_players_numbers.push(game_hash[:away][:players][player_name][:number])
  end

  if team_name == nets_team_name
    return nets_players_numbers
  elsif team_name == hornets_team_name
    return hornets_players_numbers
  end

end

def player_stats(player_name)
  nets_roster = game_hash[:home][:players]
  hornets_roster = game_hash[:away][:players]

  nets_roster.each_key do |player|
    if player == player_name
      return game_hash[:home][:players][player]
    end
  end

  hornets_roster.each_key do |player|
    if player == player_name
      return game_hash[:away][:players][player]
    end
  end
end

def big_shoe_rebounds
  # returns the number of rebounds of the player with the biggest shoe size
  nets_roster = game_hash[:home][:players]
  hornets_roster = game_hash[:away][:players]

  # construct a hash with all players as keys and shoe size as values
  all_names_and_shoes = {}

  nets_roster.each_key do | player_name |
    all_names_and_shoes[player_name] = game_hash[:home][:players][player_name][:shoe]
  end

  hornets_roster.each_key do | player_name |
    all_names_and_shoes[player_name] = game_hash[:away][:players][player_name][:shoe]
  end

  # return max hash key-value pair depending on the value of hash elements
  # returns 2 element array with [key, value]
  biggest_name_and_shoe = all_names_and_shoes.max_by {| key, value| value }
  # grab the name from the array
  biggest_name_ony = biggest_name_and_shoe[0]

  # use player name to find rebounds for that player
  nets_roster.each_key do |player|
    if player == biggest_name_ony
      return game_hash[:home][:players][player][:rebounds]
    end
  end

  hornets_roster.each_key do |player|
    if player == biggest_name_ony
      return game_hash[:away][:players][player][:rebounds]
    end
  end


end
