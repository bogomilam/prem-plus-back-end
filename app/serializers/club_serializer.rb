class ClubSerializer < ActiveModel::Serializer
  attributes :id, :competition_id, :name, :shorthand, :image, :founded, :country, :average_attendance_home, :clubStat
  # has_one :clubStat

  def clubStat
    ClubStatSerializer.new(self.object.clubStat)
  end
end
