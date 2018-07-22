# Write your code here!
require 'pry'

def game_hash
  {
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

def num_points_scored(p_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name|
      if name[0] == p_name
        return name[1][:points]
      end
    end
  end
end

def shoe_size(p_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name|
      if name[0] == p_name
        return name[1][:shoe]
      end
    end
  end
end

def team_colors(t_name)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == t_name
      return team_data[:colors]
    end
  end
end

def team_names
  team_arr = []
  game_hash.each do |location, team_data|
    team_arr << team_data[:team_name]
  end
  team_arr
end

def player_numbers(t_name)
  player_num = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == t_name
      team_data[:players].each do |name|
        player_num << name[1][:number]
      end
    end
  end
  player_num
end

def player_stats(p_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name|
      if name[0] == p_name
        return name[1]
      end
    end
  end
end

def big_shoe_rebounds
  p_largest_shoe = 0
  p_rebounds = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |name|
      if name[1][:shoe] >= p_largest_shoe
        p_largest_shoe = name[1][:shoe]
        p_rebounds = name[1][:rebounds]
      end
    end
  end
  p_rebounds
end

#bonus

def most_points_scored
  p_name = nil
  p_points = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |name|
      if name[1][:points] >= p_points
        p_name = name[0]
        p_points = name[1][:points]
      end
    end
  end
  p_name
end

def winning_team
  array_points = []
  game_hash.each do |location, team_data|
    sum_points = 0
    team_data[:players].each do |name|
      sum_points += name[1][:points] 
    end
    array_points << sum_points
  end
  
  if array_points[0] > array_points[1]
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  p_name = nil
  p_name_longest = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |name|
      if name[0].length >= p_name_longest
        p_name = name[0]
        p_name_longest = name[0].length
      end
    end
  end
  p_name
end

#super bonus

def long_name_steals_a_ton?
  p_name = nil
  p_steals = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |name|
      if name[1][:steals] >= p_steals
        p_name = name[0]
        p_steals = name[1][:steals]
      end
    end
  end
  if p_name == player_with_longest_name
    true
  else
    false
  end
end



