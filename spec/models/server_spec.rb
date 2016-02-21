require 'rails_helper'

RSpec.describe Server, type: :model do
    it { should have_and_belong_to_many(:tasks) }
end
