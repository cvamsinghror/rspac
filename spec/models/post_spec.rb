require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is invalid with a title, content, and user" do
    user = User.create(name: "shivam singh", email: "shivam@gmail.com")
    post = Post.new(title: "Test Title", content: "Test content", user: user)
    expect(post).to be_valid
  end

  it "is invalid without a title" do
    post = Post.new(title: nil)
    expect(post).not_to be_valid
  end
end