require 'rails_helper'

RSpec.describe Post, type: :model do

  context "validations" do
    it "should have title and content and user_id" do
      should have_db_column(:content).of_type(:text)
      should have_db_column(:user_id).of_type(:integer)
    end
  end

  context "associations" do
    it { is_expected.to belong_to(:user) }

  end

  context 'most recent status showed first' do
    it 'retrieves the most recent status first' do
      post_1 = Post.create(content: "I feel good, what about you?")
      post_2 = Post.create(content: "I feel terribly bad, I m sick", created_at: Time.now + 1.hour)
      expect(Post.first).to eq(post_2)
    end
  end

end