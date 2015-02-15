require 'rails_helper'

describe "Places" do
  it "is shown on the page if one is returned by the API" do
    allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return(
      [ Place.new( name:"Oljenkorsi", id: 1 ) ]
    )

    visit places_path
    fill_in('city', with: 'kumpula')
    click_button "Search"

    expect(page).to have_content "Oljenkorsi"
  end

  it "is shown on the page if multiple are returned by the API" do
    allow(BeermappingApi).to receive(:places_in).with("testplace").and_return(
      [ Place.new( name:"First", id: 1 ), Place.new( name:"Second", id: 2 ) ]
    )

    visit places_path
    fill_in('city', with: 'testplace')
    click_button "Search"

    expect(page).to have_content "First"
    expect(page).to have_content "Second"
  end

  it "shows error if API doesn't return anything" do
    allow(BeermappingApi).to receive(:places_in).with("testplace").and_return(
      [ ]
    )

    visit places_path
    fill_in('city', with: 'testplace')
    click_button "Search"

    expect(page).to have_content "No locations in testplace"
  end
end