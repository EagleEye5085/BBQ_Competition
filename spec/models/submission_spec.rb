require 'rails_helper'

RSpec.describe Submission, type: :model do
  describe 'relationships' do
    it {should belong_to :team}
  end

  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :meat }
    it { should validate_presence_of :rub }
    it { should validate_presence_of :sauce }
    it { should validate_presence_of :cook_time }
    it { should validate_presence_of :score }
    it { should allow_value(true).for(:spicy) }
    it { should allow_value(false).for(:spicy) }
  end

end
