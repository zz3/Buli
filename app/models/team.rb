# == Schema Information
# Schema version: 20101126152855
#
# Table name: teams
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Team < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name
  validates_uniqueness_of :name
  
  def self.save_bulk(parsed_array)
    return nil unless parsed_array.respond_to?('each')
    parsed_array.each() do |team_name|
      Team.create!(:name => team_name)
    end
  end
end
