class MatchSerializer < ActiveModel::Serializer
  attributes :id, :home_id, :away_id, :home_goal_count, :away_goal_count, :stadium_name, :date, :attendance, :status, :fs_match_id, :competition_id, :game_week
end
