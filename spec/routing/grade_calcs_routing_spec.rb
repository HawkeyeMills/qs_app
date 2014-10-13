require "spec_helper"

describe GradeCalcsController do
  describe "routing" do

    it "routes to #index" do
      get("/grade_calcs").should route_to("grade_calcs#index")
    end

    it "routes to #new" do
      get("/grade_calcs/new").should route_to("grade_calcs#new")
    end

    it "routes to #show" do
      get("/grade_calcs/1").should route_to("grade_calcs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/grade_calcs/1/edit").should route_to("grade_calcs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/grade_calcs").should route_to("grade_calcs#create")
    end

    it "routes to #update" do
      put("/grade_calcs/1").should route_to("grade_calcs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/grade_calcs/1").should route_to("grade_calcs#destroy", :id => "1")
    end

  end
end
