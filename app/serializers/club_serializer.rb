class ClubSerializer < ActiveModel::Serializer
  # attributes :id, :competition_id, :name, :shorthand, :image, :founded, :country, :average_attendance_home
  attributes :id, :competition_id, :name, :shorthand, :image, :founded, :country, :average_attendance_home, :table_pos,
  :played_overall, :win_home, :win_away, :draw_home, :draw_away, :loss_home, :loss_away, :goals_home, :goals_away, :concede_home, 
  :concede_away, :possessionAVG_overall, :cs_home, :cs_away, :fts_home, :fts_away, :btts_home, :btts_away, :ppg_home, :ppg_away, :win_p_home, :win_p_away 
  # has_one :clubStat
  
  # def clubStat
  #   ClubStatSerializer.new(self.object.clubStat)
  # end
end
