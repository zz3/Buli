require 'spec_helper'

describe PagesController do
  integrate_views

  #Delete these examples and add some real ones
  it "should use PagesController" do
    controller.should be_an_instance_of(PagesController)
  end


  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    it "sollte im Titel 'Bundesliga statistisch | Startseite' haben" do
      get 'home'
      response.should have_tag("title", "Bundesliga statistisch | Startseite")
    end
  end
end
