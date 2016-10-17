require 'rails_helper'

RSpec.describe User, :type => :model do
  it "has should be not valid without password" do
   u = User.new({nickname:'Sir', email:'Sir@mail.ru'})
   expect(u).to_not be_valid
end
end
