class ClubStatSerializer < ActiveModel::Serializer
  attributes :id, :club_id, :table_pos, :played_overall, :win_home, :win_away, :draw_home, :draw_away, :loss_home, :loss_away, :goals_home, :goals_away, :concede_home, :concede_away, :possessionAVG_overall, :cs_home, :cs_away, :fts_home, :fts_away, :btts_home, :btts_away, :ppg_home, :ppg_away, :win_p_home, :win_p_away
end
