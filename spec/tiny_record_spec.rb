require 'spec_helper'

describe TinyRecord do

  it 'has a version number' do
    expect(TinyRecord::VERSION).not_to be nil
  end

  it 'can be inherited' do
    Post = Class.new(TinyRecord::Base)
    expect(Post).to inherit_from TinyRecord::Base
  end
end
