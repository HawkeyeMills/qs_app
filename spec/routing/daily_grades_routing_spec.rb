require "spec_helper"

describe DailyGradesController do
  describe "routing" do

    it "routes to #index" do
      get("/daily_grades").should route_to("daily_grades#index")
    end

    it "routes to #new" do
      get("/daily_grades/new").should route_to("daily_grades#new")
    end

    it "routes to #show" do
      get("/daily_grades/1").should route_to("daily_grades#show", :id => "1")
    end

    it "routes to #edit" do
      get("/daily_grades/1/edit").should route_to("daily_grades#edit", :id => "1")
    end

    it "routes to #create" do
      post("/daily_grades").should route_to("daily_grades#create")
    end

    it "routes to #update" do
      put("/daily_grades/1").should route_to("daily_grades#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/daily_grades/1").should route_to("daily_grades#destroy", :id => "1")
    end

  end
end
