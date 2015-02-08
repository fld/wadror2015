require 'rails_helper'

describe "Beer" do
  let!(:user) { FactoryGirl.create :user }
  let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }

  before :each do
    sign_in(username:"Pekka", password:"Foobar1")
  end

  it "can be added by a logged in user" do
    visit new_beer_path
    fill_in('beer[name]', with:'Spec Testing Beer')
    select('IPA', from:'beer[style]')
    select('Koff', from:'beer[brewery_id]')

    expect{
      click_button "Create Beer"
    }.to change{current_path}.from(new_beer_path).to(beers_path)
  end
end