# Write your code here!
require 'pry'

def game_hash
	game = {
		:home => {
			:team_name => "Brooklyn Nets",
			:colors => ["Black", "White"], #array of strings
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
				  }, "Reggie Evans" => {
				  :number => 30,
				  :shoe => 14,
				  :points => 12,
				  :rebounds => 12,
				  :assists => 12,
				  :steals => 12,
				  :blocks => 12,
				  :slam_dunks => 7
				  }, "Brook Lopez" => {
				  :number => 11,
				  :shoe => 17,
				  :points => 17,
				  :rebounds => 19,
				  :assists => 10,
				  :steals => 3,
				  :blocks => 1,
				  :slam_dunks => 15
				  }, "Mason Plumlee" => {
				  :number => 1,
				  :shoe => 19,
				  :points => 26,
				  :rebounds => 12,
				  :assists => 6,
				  :steals => 3,
				  :blocks => 8,
				  :slam_dunks => 5
				  }, "Jason Terry" => {
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
				  :players =>{ 
				  "Jeff Adrien" => {
				  :number => 4,
				  :shoe => 18,
				  :points => 10,
				  :rebounds => 1,
				  :assists => 1,
				  :steals => 2,
				  :blocks => 7,
				  :slam_dunks => 2
				  }, "Bismak Biyombo" => {
				  :number => 0,
				  :shoe => 16,
				  :points => 12,
				  :rebounds => 4,
				  :assists => 7,
				  :steals => 7,
				  :blocks => 15,
				  :slam_dunks => 10
				  }, "DeSagna Diop" => {
				  :number => 2,
				  :shoe => 14,
				  :points =>24,
				  :rebounds => 12,
				  :assists => 12,
				  :steals => 4,
				  :blocks => 5,
				  :slam_dunks => 5
				  }, "Ben Gordon" => {
 					:number => 8,
				  :shoe => 15,
				  :points =>33,
				  :rebounds => 3,
				  :assists => 2,
				  :steals => 1,
				  :blocks => 1,
				  :slam_dunks => 0
					},	
				 "Brendan Haywood" => {
 					:number => 33,
				  :shoe => 15,
				  :points =>6,
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

  def num_points_scored(players_name)
  	#return number of points scored by that player
  	#find player in 

  			game_hash[:home][:players].each do |key, value|
  				if key == players_name
  					return value[:points]
  				else
  					game_hash[:away][:players].each do |key, value|
  						if key == players_name
  							return value[:points]
  						end
  					end
  				end
  			end
  end

  def shoe_size(players_name)
  		game_hash[:home][:players].each do |key, value|
  				if key == players_name
  					return value[:shoe]
  				else
  					game_hash[:away][:players].each do |key, value|
  						if key == players_name
  							return value[:shoe]
  						end
  					end
  				end
  			end
  end

  def team_colors(team_name)
  	if game_hash[:home][:team_name] == team_name
  		return game_hash[:home][:colors]
  	elsif game_hash[:away][:team_name] == team_name
  		return game_hash[:away][:colors]
  	end
  end

  def team_names
  	#returns array of team names
  	team_names =[]
  	team_names.push(game_hash[:home][:team_name])
  	team_names.push(game_hash[:away][:team_name])
  	return team_names
  end

  def player_numbers(team_name)
  	#returns jersey numbers for team	
  	array = []
  			if game_hash[:home][:team_name] == team_name
  				game_hash[:home][:players].each do |key, value|
  					array.push(game_hash[:home][:players][key][:number].to_i)
  				end
  			elsif game_hash[:away][:team_name] == team_name
  				game_hash[:away][:players].each do |key, value|
  					array.push(game_hash[:away][:players][key][:number].to_i)
  				end
  			end
  			return array 
  end

  def player_stats(players_name)
  	game_hash[:home][:players].each do |key, value|
  		if key == players_name
  			return game_hash[:home][:players][key]
  		else 
  			game_hash[:away][:players].each do |key, value|
	  			if key == players_name
	  				return game_hash[:away][:players][key]
	  			end
	  		end
  		end
  	end
  end

def big_shoe_rebounds
	array = [] #home team array shoe sizes
	array_away = [] #away team array of shoe sizes
	largest_rebound = [] #largest rebound found
	#find the player with the biggest shoes
	game_hash[:home][:players].each do |key, value|
		array.push(game_hash[:home][:players][key][:shoe])
	end
	game_hash[:away][:players].each do |key, value|
		array_away.push(game_hash[:away][:players][key][:shoe])
	end
	
	sorted_home_shoe_size = array.sort.last #biggest shoe on the home team
	sorted_away_shoe_size = array_away.sort.last #biggest shoe on the away team

	if sorted_home_shoe_size > sorted_away_shoe_size #comparing shoe sizes
		largest_shoe_size = sorted_home_shoe_size
	elsif sorted_away_shoe_size > sorted_home_shoe_size
		largest_shoe_size = sorted_away_shoe_size
	end

	game_hash[:home][:players].each do |key, values|
		if game_hash[:home][:players][key][:shoe] == largest_shoe_size
			largest_rebound.push(game_hash[:home][:players][key][:rebounds])
			return largest_rebound[0]
		else
			game_hash[:away][:players].each do |key, values| 
				if game_hash[:away][:players][key][:shoe] == largest_shoe_size
					largest_rebound.push(game_hash[:away][:players][key][:rebounds])
					return largest_rebound[0]
				end
			end
		end
	end
end

	#return that players number of rebounds