require 'rails_helper'

describe Wine do

  it { should validate_presence_of :grape}
  it { should validate_presence_of :price}
  it { should validate_uniqueness_of :grape}
end
