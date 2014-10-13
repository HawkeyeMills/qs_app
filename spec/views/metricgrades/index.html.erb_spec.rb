require 'spec_helper'

describe "metricgrades/index" do
  before(:each) do
    assign(:metricgrades, [
      stub_model(Metricgrade,
        :metric_id => 1,
        :grade_id => 2,
        :points => 3,
        :percentage => 4
      ),
      stub_model(Metricgrade,
        :metric_id => 1,
        :grade_id => 2,
        :points => 3,
        :percentage => 4
      )
    ])
  end

  it "renders a list of metricgrades" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
