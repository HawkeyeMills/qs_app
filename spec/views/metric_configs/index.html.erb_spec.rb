require 'spec_helper'

describe "metric_configs/index" do
  before(:each) do
    assign(:metric_configs, [
      stub_model(MetricConfig,
        :user_id => 1,
        :value => "Value",
        :orderby => 2,
        :profiledisplay => false,
        :updateable => false
      ),
      stub_model(MetricConfig,
        :user_id => 1,
        :value => "Value",
        :orderby => 2,
        :profiledisplay => false,
        :updateable => false
      )
    ])
  end

  it "renders a list of metric_configs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Value".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
