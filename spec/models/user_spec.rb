require 'rails_helper'

RSpec.describe User do


  before do
    @user1 = create(:user)
    post = create(:post, user: @user1)
    create(:comment, user: @user1, post: post)

    @user2 = create(:user)
    post = create(:post, user: @user2)
    2.times { create(:comment, user: @user2, post: post) }
  end


  describe "#favorited(post)" do
    it "returns 'nil' if the user has not favorited the post" do
      @user1.favorites

    end

    it "returns the appropriate favorite if it exists" do
      @user1.favorites.where(post: @post).create
      @user1.favorites
    end
  end

  describe ".top_rated" do


    it "stores a 'posts_count' on user" do
      users = User.top_rated
      expect( users.first.posts_count ).to eq(1)
    end

    it "stores a 'comments_count' on user" do
      users = User.top_rated
      expect( users.first.comments_count ).to eq(2)
    end
  end
end