require 'spec_helper'

describe "metric_grades/new" do
  before(:each) do
    assign(:metric_grade, stub_model(MetricGrade,
      :metric_id => 1,
      :grade_id => 1,
      :points => 1,
      :percentage => 1
    ).as_new_record)
  end

  it "renders new metric_grade form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", metric_grades_path, "post" do
      assert_select "input#metric_grade_metric_id[name=?]", "metric_grade[metric_id]"
      assert_select "input#metric_grade_grade_id[name=?]", "metric_grade[grade_id]"
      assert_select "input#metric_grade_points[name=?]", "metric_grade[points]"
      assert_select "input#metric_grade_percentage[name=?]", "metric_grade[percentage]"
    end
  end
end
