require 'rails_helper'

RSpec.describe "styles/edit", type: :view do
  before(:each) do
    @style = assign(:style, Style.create!(
      :name => "MyString",
      :desc => "MyText"
    ))
  end

  it "renders the edit style form" do
    render

    assert_select "form[action=?][method=?]", style_path(@style), "post" do

      assert_select "input#style_name[name=?]", "style[name]"

      assert_select "textarea#style_desc[name=?]", "style[desc]"
    end
  end
end
