require 'spec_helper'

describe "metricconfigs/edit" do
  before(:each) do
    @metricconfig = assign(:metricconfig, stub_model(Metricconfig))
  end

  it "renders the edit metricconfig form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", metricconfig_path(@metricconfig), "post" do
    end
  end
end
