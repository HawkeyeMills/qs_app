require 'spec_helper'

describe "metric_configs/show" do
  before(:each) do
    @metric_config = assign(:metric_config, stub_model(MetricConfig,
      :user_id => 1,
      :value => "Value",
      :orderby => 2,
      :profiledisplay => false,
      :updateable => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Value/)
    rendered.should match(/2/)
    rendered.should match(/false/)
    rendered.should match(/false/)
  end
end
