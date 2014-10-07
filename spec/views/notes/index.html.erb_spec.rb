require 'spec_helper'

describe "notes/index" do
  before(:each) do
    assign(:notes, [
      stub_model(Note,
        :note => "Note",
        :user_id => ""
      ),
      stub_model(Note,
        :note => "Note",
        :user_id => ""
      )
    ])
  end

  it "renders a list of notes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Note".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
