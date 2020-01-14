class MatchSerializer < ActiveModel::Serializer
  attributes :id, :home_id, :away_id, :home_goal_count, :away_goal_count, :stadium_name, :date, :attendance, :status, :fs_match_id, :competition_id, :game_week
  # has_one :away_club, serializer: ClubSerializer
  # has_one :home_club, serializer: ClubSerializer
  has_one :home_club, include_nested_associations: true
  has_one :away_club, include_nested_associations: true
  # has_one :home_club, serializer: ClubSerializer
  belongs_to :competition_id

    # def away_club
    #   {away_club: self.object.away_club, club_stats: self.object.away_club.clubStat}
    # end
end
