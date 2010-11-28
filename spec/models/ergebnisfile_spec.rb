require 'spec_helper'

describe Ergebnisfile do
  before(:each) do
    @attr = {
      :name => "/tmp/ergebnisdatei_#{Time.new.to_f.to_s}.txt"
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
    Ergebnisfile.create!(@attr)
  end
  
  describe "Dateimethoden" do
    before(:each) do
      @file = Factory(:ergebnisfile)
    end
#    describe "write" do
#      it "sollte die Elemente eines Arrays in einzelne Zeilen schreiben" do
#        @file.write(@team_arr)
#        fa = IO.readlines(@file.name)
#        fa.collect! { |ele| ele.chomp }
#        fa.should == @team_arr
#      end
#    end
    
    describe "parse_teams" do
#      before(:each) do
#        @file.write(@arr)
#      end
      it "sollte ein Array von Teamnamen aus der Datei lesen" do
        teams_arr = @file.parse_teams
        teams_arr.should == @team_arr
      end
      it "sollte genau 18 Elemente liefern" do
        teams_arr = @file.parse_teams
        teams_arr.length.should == 18
      end
    end
  end
end
