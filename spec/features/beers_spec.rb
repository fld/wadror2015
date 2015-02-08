require 'rails_helper'

describe "Beer" do
  let!(:user) { FactoryGirl.create :user }
  let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }

  before :each do
    sign_in(username:"Pekka", password:"Foobar1")
  end

  it "can be added by a logged in user and redirects to beers page" do
    visit new_beer_path
    fill_in('beer[name]', with:'Spec Testing Beer')
    select('IPA', from:'beer[style]')
    select('Koff', from:'beer[brewery_id]')

    expect{
      click_button "Create Beer"
    }.to change{current_path}.from(new_beer_path).to(beers_path)

    expect(Beer.count).to eq(1)
  end

  it "can't be added without a valid name and displays an error" do
    visit new_beer_path
    select('IPA', from:'beer[style]')
    select('Koff', from:'beer[brewery_id]')

    click_button "Create Beer"
    expect(page).to have_content 'can\'t be blank'

    expect(Beer.count).to eq(0)
  end
end