# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



    # cs1 = ClubStats.new(club_id: 1, seasonGoals_overall: 43, seasonConceded_overall: 21, seasonWinsNum_overall: 16, seasonDrawsNum_overall: 4, seasonLossesNum_overall: 1, seasonMatchesPlayed_overall: 21, seasonCS_overall: 4,
    # leaguePosition_overall: 1, average_attendance_home: 45000, cornersTotal_overall: 100, shotsTotal_overall: 200, shotsOnTargetTotal_overall:100, possessionAVG_overall: 55, foulsTotal_overall: 80, offsidesTotal_overall: 85)

    # cs2 = ClubStats.new(club_id: 2, seasonGoals_overall: 36, seasonConceded_overall: 25, seasonWinsNum_overall: 11, seasonDrawsNum_overall: 6, seasonLossesNum_overall: 4, seasonMatchesPlayed_overall: 21, seasonCS_overall: 3,
    # leaguePosition_overall: 2, average_attendance_home: 65000, cornersTotal_overall: 90, shotsTotal_overall: 150, shotsOnTargetTotal_overall: 75, possessionAVG_overall: 52, foulsTotal_overall: 96, offsidesTotal_overall: 75)

    # def remove_old_seeds
    #     Club.destroy_all
    #     puts "Clubs cleared"
    # end

    # c1 = Club.create(club_id: 1, name: "Liverpool", shorthand: "LFC", image: "LFC", founded: 1884)
    # c2 = Club.create(club_id: 2, name: "Man City", shorthand: "MCFC", image: "MCFC", founded: 2006)
    # c3 = Club.create(club_id: 3, name: "Arsenal", shorthand: "AFC", image: "AFC", founded: 1880)
    # c3 = Club.create(club_id: 3, name: "Shrewsbury", shorthand: "SALOP", image: "SFC", founded: 1980)


    # epl = Epl.new(name: "English Premier League", fs_league_id: 2012)

    # m1 = Match.new(home_id: 2, away_id: 1, home_goal_count: 2, away_goal_count: 3, stadium_id: 76, data: 01012020, attendance: 62000)
    # m2 = Match.new(home_id: 1, away_icreate2, home_goal_count: 3, away_goal_count: 1, stadium_id: 45, data: 01122020, attendance: 44000)


require_relative 'data_generation/json_to_seed'


def run
    remove_old_seeds

    data = run_json_to_seed
    
    # countries = seed_countries(data)
    # positions = seed_positions(data)
    competitions = seed_competitions(data)
    # stadia = seed_stadia(data)
    clubs = seed_clubs(data)
    # players = seed_players(data)
    # player_stats = seed_player_stats(data)
    # club_stats = seed_club_stats(data)
    matches = seed_matches(data)
    # seed_users
  
end

def remove_old_seeds
    # Country.destroy_all
    # puts "Countries cleared"

    # Position.destroy_all 
    # puts "Positions cleared"

    # Stadium.destroy_all
    # puts "Stadia cleared"

    Club.destroy_all
    puts "Clubs cleared"

    Competition.destroy_all
    puts "Competition Cleared"

    # Player.destroy_all
    # puts "Players cleared"

    # PlayerStat.destroy_all
    # puts "Player stats cleared"

    # ClubStat.destroy_all
    # puts "Club stats cleared"

    Match.destroy_all
    puts "Matches cleared"

    # User.destroy_all
    # puts "Users cleared"

end

# def seed_countries(data)
#     countries = data[:country_hash].keys
#     countries.each do |country|
#         Country.create(name: country)    
#     end
#     puts "Countries seeded"
# end

# def seed_positions(data)
#     positions = data[:position_hash].keys
#     positions.each do |position|
#         Position.create(name: position)
#     end
#     puts "Positions seeded"
# end

def seed_competitions(data)
    competitions = data[:competition_array]
    competitions.each do |comp|
        Competition.create(league_id: comp[:league_id], name: comp[:name])
    end
    puts "Competitions seeded"
end

# def seed_stadia(data)
#     stadia = data[:stadium_hash]
#     stadia.each do |stadium|
#         Stadium.create(fs_club_id: stadium[0], name: stadium[1])
#     end
#     puts "Stadia seeded"
# end

def seed_clubs(data)
    clubs = data[:club_array]
    stadiums = data[:stadium_hash]
    clubs.each do |c|
        Club.create(
            name: c[:name],
            shorthand: c[:shorthand],
            country: c[:country],
            image: c[:image],
            founded: c[:founded],
            id: c[:club_id],
            competition_id: c[:competition_id],
            average_attendance_home: c[:average_attendance_home],
            table_pos: c[:table_pos],
            played_overall: c[:played_overall],
            win_home: c[:win_home],
            win_away:  c[:win_away],
            draw_home: c[:draw_home],
            draw_away: c[:draw_away],
            loss_home: c[:loss_home],
            loss_away: c[:loss_away],
            goals_home: c[:goals_home],
            goals_away: c[:goals_away],
            concede_home: c[:concede_home],
            concede_away: c[:concede_away],
            possessionAVG_overall: c[:possessionAVG_overall],
            cs_home: c[:cs_home],
            cs_away: c[:cs_away],
            fts_home: c[:fts_home],
            fts_away: c[:fts_away],
            btts_home: c[:btts_home],
            btts_away: c[:btts_away],
            ppg_home: c[:ppg_home],
            ppg_away: c[:ppg_away],
            win_p_home: c[:win_p_home],
            win_p_away: c[:win_p_away]
        )
    end
    puts "Clubs seeded"

end

# def seed_players(data)
#     players = data[:player_array]
#     players.each do |p|
#         Player.create(
#             name: p[:name],
#             shorthand: p[:shorthand],
#             country_id: Country.find_by(name:p[:country]).id,
#             birthday: p[:birthday],
#             position_id: Position.find_by(name:p[:position]).id,
#             club_id: Club.find_by(fs_club_id:p[:fs_club_id]).id,
#             fs_player_id: p[:fs_player_id],
#             competition_id: Competition.find_by(fs_league_id:p[:fs_competition_id]).id
#         )     
#     end
#     puts "Players seeded"
# end

# def seed_player_stats(data)
#     player_stats = data[:player_stats_array]
#     player_stats.each do |p|
#         PlayerStat.create(
#             player_id: Player.find_by(fs_player_id:p[:fs_player_id]).id,
#             appearances_overall: p[:appearances_overall],
#             minutes_played_overall: p[:minutes_played_overall],
#             goals_overall: p[:goals_overall],
#             clean_sheets_overall: p[:clean_sheets_overall],
#             conceded_overall: p[:conceded_overall],
#             penalty_goals: p[:penalty_goals],
#             penalty_misses: p[:penalty_misses],
#             assists_overall: p[:assists_overall],
#             yellow_cards_overall: p[:yellow_cards_overall],
#             red_cards_overall: p[:red_cards_overall]
#         )
#     end
#     puts "Player Stats seeded"
# end

# def seed_club_stats(data)
#     club_stats = data[:club_stats_array]
#     club_stats.each do |c|
#         ClubStat.create(
#             club_id: Club.find_by(club_id:c[:club_id]).id,
#             table_pos: c[:table_pos],
#             played_overall: c[:played_overall],
#             win_home: c[:win_home],
#             win_away:  c[:win_away],
#             draw_home: c[:draw_home],
#             draw_away: c[:draw_away],
#             loss_home: c[:loss_home],
#             loss_away: c[:loss_away],
#             goals_home: c[:goals_home],
#             goals_away: c[:goals_away],
#             concede_home: c[:concede_home],
#             concede_away: c[:concede_away],
#             possessionAVG_overall: c[:possessionAVG_overall],
#             cs_home: c[:cs_home],
#             cs_away: c[:cs_away],
#             fts_home: c[:fts_home],
#             fts_away: c[:fts_away],
#             btts_home: c[:btts_home],
#             btts_away: c[:btts_away],
#             ppg_home: c[:ppg_home],
#             ppg_away: c[:ppg_away],
#             win_p_home: c[:win_p_home],
#             win_p_away: c[:win_p_away]
#         )
#     end
#     puts "Club Stats seeded"
# end

def seed_matches(data)
    matches = data[:matches_array]
    matches.each_with_index do |m, i|
        home_club = Club.find_by(id:m[:home_id])
        away_club = Club.find_by(id:m[:away_id])

        my_match = Match.create(
            home_id: home_club.id,
            away_id: away_club.id,
            home_goal_count: m[:home_goal_count],
            away_goal_count: m[:away_goal_count],
            stadium_name: m[:stadium_name],
            date: m[:date],
            attendance: m[:attendance],
            status: m[:status],
            fs_match_id: m[:fs_match_id],
            competition_id: Competition.find_by(league_id:m[:fs_competition_id]).id,
            game_week: m[:game_week]
        )
    end
    puts "Matches seeded"
end


# def seed_users
#     users_arr = [
#         {username: "testuser1", email: "user1@gmail.com", password: "user1", password_confirmation: "user1"},
#         {username: "testuser2", email: "user2@gmail.com", password: "user2", password_confirmation: "user2"},
#         {username: "testuser3", email: "user3@gmail.com", password: "user3", password_confirmation: "user3"}
#     ]
#     User.create(users_arr)
# end

run