require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        }, {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        }, {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        }, {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        }, {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        }, {
          player_name: "Bismak Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        }, {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        }, {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        }, {
          player_name: "Brendan Haywood",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }

end



        # num_points_scored => takes in an argument of a player's name and returns the number of points scored for that player.
        # where to find player's `:points` in the hash? How to iterate down into that level?
        # => Think about  method's return value... #each` returns the original collection that you are iterating over. How can you return the number of points for a particular player?


def num_points_scored(name)
   game_hash.map do |location, team_data|
    #attribute = :team_name, data = string_name
    #go through all locations and main team data hash
      team_data[:players].map do |player_hash|
        #then go thru the :players and tracking their individual hashes
        if player_hash[:player_name] == name
          #does the value of :player_name match the one passed in?
          return player_hash[:points]
          #if true, then return their points
        end
      end
   end
end


        #"shoe size" takes in an argument of a player's name and returns the shoe size for that player.
        #Think about how to find shoe size for right player? How can you check if a player's name matches the name that has been passed into the method as an argument?

def shoe_size(name)
  game_hash.map do |location, team_data|
    team_data[:players].map do |player_hash|
      #check player NAME match the arg name
      if player_hash[:player_name] == name
        #then return that players size
      return player_hash[:shoe]
      end
    end
  end
end


      # team colors => takes in an argument of the team name and returns an array of that teams colors

def team_colors(team_name)
  game_hash.map do |location, team_data|
    #check for team name match- bc that is the parameter
    if team_data[:team_name] == team_name
      #then if thats true, return their colors
    return team_data[:colors]
    end
  end
end

        # team names => operates on the game hash to return an array of the team names.

def team_names
  game_hash.map do |location, team_data|
    #go through data, access value from :team_name keys
    team_data[:team_name]
  end
end


      # 'player numbers' =>takes in an argument of a team name and returns an array of the jersey number's for that team.


def player_numbers(team)
  numbers_array= []
  game_hash.map do |location, team_data|
    if team_data[:team_name] == team
      #if team name matches the argument
       team_data[:players].map do |player_hash|
         #go through that teams players
          numbers_array << player_hash[:number]
            #collect each number and store in an array
         end
      end
   end
   numbers_array
end


      # 'player_stats' => takes in an argument of a player's name and returns a hash of that player's stats.
      #so create hash with :player_name removed =     player_stats("Alan Anderson")
          #=> { :number => 0,  :shoe => 16, :points => 22,...}

def player_stats(name)

  stat_hash ={}
  game_hash.map do |location, team_data|
    team_data[:players].map do |player_hash|

      if player_hash[:player_name] == name #if match the name argument
        player_hash.delete(:player_name)
        #delete them from the hash by its key
        stat_hash = player_hash #then reassign the remains of the hash to a new hash, 'stats'

      end
    end
  end
  stat_hash
end


      #'big shoe rebounds' => return the number of rebounds associated with the player that has the largest shoe size; 2 steps:
        # First, find the player with the largest shoe size
        # Then, return that player's number of rebounds

def big_shoe_rebounds
  shoe_size = 0 #set to 0, number value
  rebounds = 0 #set to 0, number value
  
  game_hash.map do |location, team_data|
    team_data[:players].map do |player_hash|
      if player_hash[:shoe] > shoe_size #go through every player, track data. check if their size is bigger than one before?
        shoe_size = player_hash[:shoe] # shoe size value = that player who met the condition
        rebounds = player_hash[:rebounds] #rebounds now rep rebounds for that player
      end
    end
  end
  rebounds
end




      #1. Which player has the most points? Call the method `most_points_scored`.


def most_points_scored
  most_points = 0
  player = ''
  game_hash.map do |location, team_data|
    team_data[:players].map do |player_hash|
      if player_hash[:points] > most_points #if that player's points > most points
        most_points = player_hash[:points] #most points rep value of player with most points
        player = player_hash[:player_name] #assign 'player: now represents that players name'
      end
    end
  end
  player
end


    # => 2. Which team has the most points? Call the method `winning_team`.


def winning_team
  home_pts = 0
  away_pts = 0

  game_hash[:home][:players].map do |player_hash|
    home_pts += player_hash[:points] #each loop add the player on home teams points to counter variable
  end
  game_hash[:away][:players].map do |player_hash|
    away_pts += player_hash[:points] #each loop add player on away team points to their counter var
  end
  #return the right team name by checking who has more points
  if home_pts > away_pts
    game_hash[:home][:team_name]
  elsif away_pts > home_pts
    game_hash[:away][:team_name]
  end
end


    #3. Which player has the longest name? Call the method `player_with_longest_name`.

def player_with_longest_name
  longest = 0 #
  player_name = ''
  game_hash.map do |location, team_data|
    team_data[:players].map do |name_hash, value|
      if name_hash[:player_name].size > longest
        player_name = name_hash[:player_name] #now the name we return will have the value of the longest name!
      end
    end
  end
  player_name #can return that person
end




    ##difficult! ###

    #1. Write a method that returns true if the player with the longest name had the most steals.


def long_name_steals_a_ton?
  steals = 0
  long_name_stealer = ''
  game_hash.map do |location, team_data|
    team_data[:players].map do |player_hash|
      # go through player data, check if player steals are greatest
      if player_hash[:steals] > steals
        #if true: assign value of that players steals to 'steals' var
        steals = player_hash[:steals]
        #assign that players name to long_name variable
        long_name_stealer = player_hash[:player_name]
      end
    end
  end
  #finally: check if true (==) that the guy with the most steals MATCHES guy with longest name !
  long_name_stealer == player_with_longest_name
end
