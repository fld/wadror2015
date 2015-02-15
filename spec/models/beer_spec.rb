require 'rails_helper'

  describe Beer do

    describe "has name and style" do
      let!(:style) { FactoryGirl.create :style }
      let(:beer){ Beer.create name:"TestBeer", style:style }
    
      it "is saved" do
        expect(beer).to be_valid
        expect(Beer.count).to eq(1)
      end
    end

    describe "has no style" do
      let(:beer){ Beer.create name:"TestBeer" }
    
      it "is not saved" do
        expect(beer).not_to be_valid
        expect(Beer.count).to eq(0)
      end
    end

    describe "has no name" do
      let(:beer){ Beer.create }
    
      it "is not saved" do
        expect(beer).not_to be_valid
        expect(Beer.count).to eq(0)
      end
    end

  end