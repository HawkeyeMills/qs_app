require 'spec_helper'

describe "notes/edit" do
  before(:each) do
    @note = assign(:note, stub_model(Note,
      :note => "MyString",
      :user_id => ""
    ))
  end

  it "renders the edit note form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", note_path(@note), "post" do
      assert_select "input#note_note[name=?]", "note[note]"
      assert_select "input#note_user_id[name=?]", "note[user_id]"
    end
  end
end
