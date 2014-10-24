require 'spec_helper'

describe "daily_grades/show" do
  before(:each) do
    @daily_grade = assign(:daily_grade, stub_model(DailyGrade,
      :grade_id => "",
      :points => "",
      :possible => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
