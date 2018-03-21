require 'rails_helper'

describe Style do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should belong_to :menu }
end


