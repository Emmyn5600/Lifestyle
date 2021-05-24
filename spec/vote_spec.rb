require 'rails_helper'

RSpec.describe Vote, type: :model do
  subject do
    described_class.new(
      article_id: '',
      user_id: ''
    )
  end

  describe 'Validations' do
    it 'is not valid without valid attributes' do
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations' do
    it { should belong_to(:user).without_validating_presence }
    it { should belong_to(:article).without_validating_presence }
  end
end
