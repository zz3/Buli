require 'spec_helper'

describe Team do
  before(:each) do
    @attr = {
      :name => "Bayern München"
    }
    @team_arr = %w(Bayern
                      Wolfsburg
                      1.\ FC\ Köln
                      Lautern
                      Gladbach
                      Nürnberg
                      Freiburg
                      St.\ Pauli
                      Hoffenheim
                      Bremen
                      Hannover
                      Frankfurt
                      Hamburg
                      Schalke
                      Mainz
                      Stuttgart
                      Dortmund
                      Bayer\ 04)
    
  end

  it "should create a new instance given valid attributes" do
    Team.create!(@attr)
  end
  
  it "sollte einen Namen (name) haben" do
    @attr_invalid = @attr.merge!(:name => '')
    no_name_team = Team.new(@attr)
    no_name_team.should_not be_valid
  end
  it "sollte keinen schon vergebenen Namen (name) haben" do
    Team.create!(@attr)
    team_doppelt = Team.new(@attr)
    team_doppelt.should_not be_valid
  end
  
#  describe "Team Datei Parser (parse_teams)" do
#    it "sollte ein Array mit Teamnamen erzeugen" do
#      file = "~/teams.txt"
#      teams_array = Team.parse(file)
#      teams_array.should == ["Bayern", "Bremen", "Leverkusen"]
#    end
#  end
  
  describe "bulk Methode save_bulk" do
    it "sollte ein Array von Teams entgegennehmen und speichern" do
      @file = Factory(:ergebnisfile)
      Team.save_bulk(@file.parse_teams)
      @team_arr.each do |teamname|
        Team.find_by_name(teamname).name.should == teamname
      end
    end
  end
end
