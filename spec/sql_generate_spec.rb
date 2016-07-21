require 'spec_helper'

describe TinyRecord, "sql generate" do
  before do
    class Post < TinyRecord::Base; end
    class User < TinyRecord::Base; end
  end

  it "has correct table name" do
    expect(Post.table_name).to eq "posts"
    expect(User.table_name).to eq "users"
  end

  it "has an instance of Arel table for database schema projection" do
    expect(Post.arel_table).to be_a Arel::Table
  end

  it "respond to all method" do
    expect(Post.all).to be_a Arel::SelectManager
  end

  it "generate correct sql in all method" do
    expect(Post.all.to_sql).to eq "SELECT * FROM posts"
  end

  it "can generate correct sql with where condition" do
    expect(Post.where(id: 2).to_sql).to eq "SELECT * FROM posts WHERE posts.id = '2'"
  end

  
end
