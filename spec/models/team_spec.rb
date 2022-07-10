require 'rails_helper'

RSpec.describe Team do

  describe 'relationships' do
    it {should have_many :submissions}
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :members }
    it { should validate_presence_of :wins }
    it { should allow_value(true).for(:last_year_winner) }
    it { should allow_value(false).for(:last_year_winner) }
  end
end
