require 'spec_helper'

describe "metricconfigs/index" do
  before(:each) do
    assign(:metricconfigs, [
      stub_model(Metricconfig),
      stub_model(Metricconfig)
    ])
  end

  it "renders a list of metricconfigs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
