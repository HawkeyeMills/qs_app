require 'spec_helper'

describe "metric_grades/edit" do
  before(:each) do
    @metric_grade = assign(:metric_grade, stub_model(MetricGrade,
      :metric_id => 1,
      :grade_id => 1,
      :points => 1,
      :percentage => 1
    ))
  end

  it "renders the edit metric_grade form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", metric_grade_path(@metric_grade), "post" do
      assert_select "input#metric_grade_metric_id[name=?]", "metric_grade[metric_id]"
      assert_select "input#metric_grade_grade_id[name=?]", "metric_grade[grade_id]"
      assert_select "input#metric_grade_points[name=?]", "metric_grade[points]"
      assert_select "input#metric_grade_percentage[name=?]", "metric_grade[percentage]"
    end
  end
end
