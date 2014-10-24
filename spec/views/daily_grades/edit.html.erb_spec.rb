require 'spec_helper'

describe "daily_grades/edit" do
  before(:each) do
    @daily_grade = assign(:daily_grade, stub_model(DailyGrade,
      :grade_id => "",
      :points => "",
      :possible => ""
    ))
  end

  it "renders the edit daily_grade form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", daily_grade_path(@daily_grade), "post" do
      assert_select "input#daily_grade_grade_id[name=?]", "daily_grade[grade_id]"
      assert_select "input#daily_grade_points[name=?]", "daily_grade[points]"
      assert_select "input#daily_grade_possible[name=?]", "daily_grade[possible]"
    end
  end
end
