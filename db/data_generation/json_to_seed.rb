require 'json'


def import_json
    file = File.read("#{__dir__}/league_2012_data.json")
    data_hash = JSON.parse(file)
end

def model_data(data_hash)

    # country_hash = getCountries(data_hash)
    # stadium_hash = getStadiums(data_hash)
    competition_array = getCompetitions(data_hash)
    club_array = getClubs(data_hash)
    # position_hash = getPositions
    # player_array = getPlayers(data_hash)
    # player_stats_array = getPlayerStats(data_hash)
    club_stats_array = getClubStats(data_hash)
    matches_array = getMatches(data_hash)

    data = {
        # :country_hash => country_hash,
        # :stadium_hash => stadium_hash,
        :competition_array => competition_array,
        :club_array => club_array,
        # :position_hash => position_hash, 
        # :player_array => player_array,
        # :player_stats_array => player_stats_array,
        :club_stats_array => club_stats_array,
        :matches_array => matches_array
    }
end

# def getCountries(data_hash)
#     country_array = data_hash["countries"]["data"].map{|country|country["name"]}.sort
#     country_hash = {}
#     country_array.each_with_index do |country, i|
#         country_hash[country] = i+1
#     end
#     country_hash
#     #country_hash is hash of hashes {country:id}
# end

# def getStadiums(data_hash)
#     matches = data_hash["matches"]["data"]
#     stadiums_hash = {}

#     stadiums_array = matches.map{|match| {match["homeID"] => match["stadium_name"]}}.uniq.select{|stadium| stadium.values[0].size > 0}

#     stadiums_array.each{|stadium| stadiums_hash[stadium.keys[0]] = stadium.values[0]}

#     stadiums_hash
# end

def getCompetitions(data_hash)
    competition_array = [] 

    competition = {}
    
    competition[:league_id] = 2012
    competition[:name] = "Premier League 2019/2020"

    competition_array << competition

    competition_array
end

def getClubs(data_hash)
    club_array = []
    club_hash = data_hash["teams"]["data"]

    club_hash.map do |c|
        club = {}
        club[:club_id] = c["id"]
        club[:competition_id] = c["competition_id"]
        club[:name] = c["name"]
        club[:shorthand] = c["shortHand"]
        club[:country] = c["country"]
        club[:image] = c["image"]
        club[:founded] = c["founded"].to_i
        club[:stadium_id] = nil
        club[:average_attendance_home] = c["stats"]["average_attendance_overall"]
        club_array << club
    end
    #clubs array has hashes of clubs with required data, except stadium_id=>nil
    club_array
end

# def getPositions
#     position_hash = {
#         "Goalkeeper" => 1,
#         "Defender" => 2,
#         "Midfielder" => 3,
#         "Forward" => 4
#     }
# end

# def getPlayers(data_hash)
#     player_array = []
#     player_hash = data_hash["players"]["data"]

#     player_hash.map do |p|
#         player = {}
#         player[:name] = p["known_as"]
#         player[:shorthand] = p["shorthand"]
#         check_edge_case_nationalities(p)
#         player[:country] = p["nationality"]
#         player[:birthday] = p["birthday"]
#         player[:position] = p["position"]
#         player[:fs_club_id] = p["club_team_id"]
#         player[:fs_player_id] = p["id"]
#         player[:fs_competition_id] = p["competition_id"]
#         player_array << player
#     end
#     player_array
# end

# def check_edge_case_nationalities(p)
#     if p["nationality"] == "Côte d'Ivoire"
#         p["nationality"] = "Ivory Coast"
#     end
# end

# def getPlayerStats(data_hash)
#     player_stats_array = []
#     player_stats_hash = data_hash["players"]["data"]

#     player_stats_hash.map do |p|
#         player = {}
#         player[:fs_player_id] = p["id"]
#         player[:appearances_overall] = p["appearances_overall"]
#         player[:minutes_played_overall] = p["minutes_played_overall"]
#         player[:goals_overall] = p["goals_overall"]
#         player[:clean_sheets_overall] = p["clean_sheets_overall"]
#         player[:conceded_overall] = p["conceded_overall"]
#         player[:penalty_goals] = p["penalty_goals"]
#         player[:penalty_misses] = p["penalty_misses"]
#         player[:assists_overall] = p["assists_overall"]
#         player[:yellow_cards_overall] = p["yellow_cards_overall"]
#         player[:red_cards_overall] = p["red_cards_overall"]
#         player_stats_array << player
#     end
#     player_stats_array
# end

def getClubStats(data_hash)
    club_stats_array = []
    club_stats_hash = data_hash["teams"]["data"]

    club_stats_hash.map do |c|
        club = {}
        club[:club_id] = c["id"]
        club[:table_pos] = c["table_position"]
        club[:played_overall] = c["stats"]["seasonMatchesPlayed_overall"]
        club[:win_home] = c["stats"]["winPercentage_home"]
        club[:win_away] = c["stats"]["winPercentage_away"]
        club[:draw_home] = c["stats"]["drawPercentage_home"]
        club[:draw_away] = c["stats"]["drawPercentage_away"]
        club[:loss_home] = c["stats"]["losePercentage_home"]
        club[:loss_away] = c["stats"]["losePercentage_away"]
        club[:goals_home] = c["stats"]["seasonScoredNum_home"]
        club[:goals_away] = c["stats"]["seasonScoredNum_away"]
        club[:concede_home] = c["stats"]["seasonConcededNum_home"]
        club[:concede_away] = c["stats"]["seasonConcededNum_away"]
        club[:possessionAVG_overall] = c["stats"]["possessionAVG_overall"]
        club[:cs_home] = c["stats"]["seasonCS_home"]
        club[:cs_away] = c["stats"]["seasonCS_away"]
        club[:fts_home] = c["stats"]["seasonFTS_home"]
        club[:fts_away] = c["stats"]["seasonFTS_away"]
        club[:btts_home] = c["stats"]["seasonBTTS_home"]
        club[:btts_away] = c["stats"]["seasonBTTS_away"]
        club[:ppg_home] = c["stats"]["seasonPPG_home"]
        club[:ppg_away] = c["stats"]["seasonPPG_away"]
        club[:win_p_home] = c["stats"]["winPercentage_home"]
        club[:win_p_away] = c["stats"]["winPercentage_away"]
        club_stats_array << club
    end
    club_stats_array
end

def getMatches(data_hash)
    matches_array = []
    matches_hash = data_hash["matches"]["data"]

    matches_hash.map do |m|
        match = {}
        match[:home_id] = m["homeID"]
        match[:away_id] = m["awayID"]
        match[:home_goal_count] = m["homeGoalCount"]
        match[:away_goal_count] = m["awayGoalCount"]
        match[:stadium_name] = m["stadium_name"]
        match[:date] = m["date_unix"]
        match[:attendance] = m["attendance"]
        match[:status] = m["status"]
        match[:fs_match_id] = m["id"]
        match[:fs_competition_id] = m["competition_id"]
        match[:game_week] = m["game_week"]
        matches_array << match
    end
    matches_array
end

def run_json_to_seed
    data_hash = import_json
    model_data(data_hash)
end

run_json_to_seed
