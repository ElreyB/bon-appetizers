require 'rails_helper'

describe Dessert do

  it { should validate_presence_of :name}
  it { should validate_presence_of :price}
  it { should validate_uniqueness_of :name}
end
