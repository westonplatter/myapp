require 'rails_helper'

RSpec.describe User, type: :model do
  describe "should work" do
    it "user" do
      expect(FactoryBot.create(:user).id > 0)
    end
    it "admin" do
      expect(FactoryBot.create(:admin).id > 0)
    end
  end
end
