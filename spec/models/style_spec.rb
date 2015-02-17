require 'rails_helper'

RSpec.describe Style, type: :model do
  describe "has name and description" do
    let!(:style) { FactoryGirl.create :style }
  
    it "is valid and saved" do
      expect(style).to be_valid
      expect(Style.count).to eq(1)
    end
  end
end
