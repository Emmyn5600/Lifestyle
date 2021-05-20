require 'rails_helper'

RSpec.describe Article, type: :model do
  subject do
    described_class.new(
      title: 'cool',
      text: 'cool',
      image: 'cool'
    )
  end

  describe 'Validations' do
    it 'is not valid without a user' do
      expect(subject).to_not be_valid
    end

    it 'is not valid without a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a text' do
      subject.text = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an image' do
      subject.image = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations' do
    it { should belong_to(:user).without_validating_presence }
    it { should have_many(:votes) }
    it { should have_many(:voters).through(:votes) }
    it { should have_many(:companies) }
    it { should have_many(:categories).through(:companies) }
    it { should have_many(:comments) }
  end
end
