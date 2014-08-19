require 'spec_helper'

describe "metrics/index" do
  before(:each) do
    assign(:metrics, [
      stub_model(Metric),
      stub_model(Metric)
    ])
  end

  it "renders a list of metrics" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
