class Team < ActiveRecord::Base
  has_many :teams_competitions
  has_many :competitions, through: :teams_competitions
  has_many :teams_users
  has_many :users, through: :teams_users, :class_name => 'User'
  accepts_nested_attributes_for :teams_users, :reject_if=>:all_blank, :allow_destroy=>true
  accepts_nested_attributes_for :users
  has_many :fixtures
  
end
