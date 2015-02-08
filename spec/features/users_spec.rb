require 'rails_helper'

describe "User" do
  describe "who has signed up" do
    let!(:user) { FactoryGirl.create :user }
    it "can signin with right credentials" do
      sign_in(username:"Pekka", password:"Foobar1")

      expect(page).to have_content 'Welcome back!'
      expect(page).to have_content 'Pekka'
    end

    it "is redirected back to signin form if wrong credentials given" do
      sign_in(username:"Pekka", password:"wrong")

      expect(current_path).to eq(signin_path)
      expect(page).to have_content 'Username and/or password mismatch'
    end

    it "when signed up with good credentials, is added to the system" do
      visit signup_path
      fill_in('user_username', with:'Brian')
      fill_in('user_password', with:'Secret55')
      fill_in('user_password_confirmation', with:'Secret55')

      expect{ click_button('Create User') }.to change{User.count}.by(1)
    end
  end

  describe "profile" do
    let!(:user) { FactoryGirl.create :user }
    let!(:user2) { FactoryGirl.create :user2 }
    let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }
    let!(:beer) { FactoryGirl.create :beer, name:"iso 3", brewery:brewery }
    let!(:rating) { FactoryGirl.create :realrating, user:user2, beer:beer }
    let!(:rating2) { FactoryGirl.create :realrating, user:user, beer:beer }

    it "shows only ratings owned by the user" do
      expect(Rating.count).to eq(2)
      sign_in(username:"Pekka", password:"Foobar1")
      visit user_path(user)
      expect(page).to have_content 'has rated 1 beers'
    end

    it "can delete ratings owned by the user" do
      sign_in(username:"Pekka", password:"Foobar1")
      visit user_path(user)
      expect { click_link('delete') }.to change(Rating, :count).by(-1)
    end
  end
  
end