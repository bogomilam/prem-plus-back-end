class ClubSerializer < ActiveModel::Serializer
  attributes :id, :competition_id, :name, :shorthand, :image, :founded, :country, :average_attendance_home
end
