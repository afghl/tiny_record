require 'spec_helper'

describe TinyRecord, "sql generate" do
  before(:all) do
    Post ||= Class.new(TinyRecord::Base)
    User ||= Class.new(TinyRecord::Base)
  end

  it "has correct table name" do
    expect(Post.table_name).to eq "posts"
    expect(User.table_name).to eq "users"
  end

  it "generate correct sql in all method" do
    expect(Post.all.to_sql).to eq "SELECT * FROM posts"
  end

  it "can generate correct sql with where condition" do
    expect(Post.where(id: 2).to_sql).to eq "SELECT * FROM posts WHERE posts.id = '2'"
  end

  it "can generate correct with multiple condition" do
    expect(Post.where(id: 2, content: "hello").to_sql).to eq "SELECT * FROM posts WHERE posts.id = '2' AND posts.content = 'hello'"
  end

end
