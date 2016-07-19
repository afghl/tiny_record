require 'spec_helper'

describe TinyRecord, "sql generation" do
  before do
    class Post < TinyRecord::Base; end
    class User < TinyRecord::Base; end
  end

  it "response to :all method" do
    expect(Post.respond_to?(:all)).to be true
  end

  it "has correct table name" do
    expect(Post.table_name).to eq "posts"
    expect(User.table_name).to eq "users"
  end

  it "has an instance of Arel table for database schema projection" do
    expect(Post.table).to be_a Arel::Table
  end

  xit "generate correct sql in all method" do
    expect(Post.all.to_sql).to eq "SELECT * FROM posts;"
  end
end
