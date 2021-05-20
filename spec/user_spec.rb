require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(name: 'test')
  end

  describe '#Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end

  describe 'Associations' do
    it { should have_many(:articles) }
    it { should have_many(:votes) }
    it { should have_many(:voted_articles).through(:votes) }
    it { should have_many(:comments) }
  end
end