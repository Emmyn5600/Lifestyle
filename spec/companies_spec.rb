require 'rails_helper'

RSpec.describe Company, type: :model do
    subject do
        described_class.new(
            article_id: '',
            category_id: ''
        )
    end

    describe 'Validations' do
        it 'is not valid' do
            expect(subject).to_not be_valid
        end
    end

    describe 'Associations' do
        it { should belong_to(:category).without_validating_presence }

        it { should belong_to(:article).without_validating_presence }
    end
end