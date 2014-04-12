class Competition < ActiveRecord::Base
  has_many :fixtures
  has_many :teams_competitions
  has_many :teams, through: :teams_competitions
  accepts_nested_attributes_for :teams_competitions, :reject_if=>:all_blank, :allow_destroy=>true
  accepts_nested_attributes_for :teams, :reject_if=>:all_blank, :allow_destroy=>true
end
