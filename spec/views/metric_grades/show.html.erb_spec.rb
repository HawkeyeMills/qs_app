require 'spec_helper'

describe "metric_grades/show" do
  before(:each) do
    @metric_grade = assign(:metric_grade, stub_model(MetricGrade,
      :metric_id => 1,
      :grade_id => 2,
      :points => 3,
      :percentage => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
  end
end
