require 'spec_helper'

describe "metrics/edit" do
  before(:each) do
    @metric = assign(:metric, stub_model(Metric))
  end

  it "renders the edit metric form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", metric_path(@metric), "post" do
    end
  end
end
