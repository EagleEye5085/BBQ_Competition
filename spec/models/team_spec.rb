require 'rails_helper'

RSpec.describe Team do
  it {should have_many :submissions}
end
