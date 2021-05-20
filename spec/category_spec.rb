require 'rails_helper'

RSpec.describe Category, type: :model do
    subject do
      described_class.new(
        name: 'running',
        priority: 12
      )
    end
  

    describe 'Validations' do
        it 'is valid' do
          expect(subject).to be_valid
        end
      end
    

      describe 'Associations' do
        it { should have_many(:companies) }
        it { should have_many(:articles).through(:companies) }
      end
end