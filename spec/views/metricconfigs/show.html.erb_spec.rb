require 'spec_helper'

describe "metricconfigs/show" do
  before(:each) do
    @metricconfig = assign(:metricconfig, stub_model(Metricconfig))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
