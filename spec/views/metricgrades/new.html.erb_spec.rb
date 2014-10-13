require 'spec_helper'

describe "metricgrades/new" do
  before(:each) do
    assign(:metricgrade, stub_model(Metricgrade,
      :metric_id => 1,
      :grade_id => 1,
      :points => 1,
      :percentage => 1
    ).as_new_record)
  end

  it "renders new metricgrade form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", metricgrades_path, "post" do
      assert_select "input#metricgrade_metric_id[name=?]", "metricgrade[metric_id]"
      assert_select "input#metricgrade_grade_id[name=?]", "metricgrade[grade_id]"
      assert_select "input#metricgrade_points[name=?]", "metricgrade[points]"
      assert_select "input#metricgrade_percentage[name=?]", "metricgrade[percentage]"
    end
  end
end
