require 'spec_helper'

describe "metricconfigs/new" do
  before(:each) do
    assign(:metricconfig, stub_model(Metricconfig).as_new_record)
  end

  it "renders new metricconfig form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", metricconfigs_path, "post" do
    end
  end
end
