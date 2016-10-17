require 'rails_helper'

RSpec.describe Post, :type => :model do
  
   p = Post.new
   p.title = 'Way to North'
   p.body = 'People ofter prefer the way to the Sourth, but...'
   p.published_at = Time.now
   p.author = User.new({nickname: 'quentin', email: 'quentin@ma.ru', password: 'secreat'})
  it 'should be valid with full data' do
    expect(p).to be_valid
  end 
   
  it "has should be not valid without author" do
    p.author = nil
   
   expect(p).to_not be_valid
   end
end
