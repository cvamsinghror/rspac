require 'rails_helper'

RSpec.describe "Posts API", type: :request do
  let(:user) { User.create(name: "John Doe", email: "john@example.com") }
  
  it "retrieves a list of posts" do
    user.posts.create(title: "First Post", content: "This is the content")
    get "/users/#{user.id}/posts"
    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body).size).to eq(1)
  end

  it "retrieves a specific post" do
    post = user.posts.create(title: "First Post", content: "This is the content")
    get "/users/#{user.id}/posts/#{post.id}"
    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body)["title"]).to eq("First Post")
  end
end
