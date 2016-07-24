require 'spec_helper'

describe TinyRecord, "querying" do
  before(:all) do
    Post ||= Class.new(TinyRecord::Base)
    User ||= Class.new(TinyRecord::Base)
  end

  it "can get record count of a table" do
    expect(Post.count).to eq 0
  end

end
