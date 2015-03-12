require 'rails_helper'

RSpec.describe Image do
  describe '.create' do
    it 'creates a new image' do
      expect(Image.create()).to be_a Image
    end

    it 'is invalid without a url' do
      expect(Image.create()).not_to be_valid
    end

    it 'is valid with a url' do
      expect(Image.create(url: 'http://sampleurl.com')).to be_valid
    end

    it 'has a default of 0 wins' do
      expect((Image.create(url: 'http://sampleurl.com')).wins).to eq 0
    end

    it 'has a default of 0 flags' do
      expect((Image.create(url: 'http://sampleurl.com')).flags).to eq 0
    end
  end
end
