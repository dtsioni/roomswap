require 'spec_helper'

describe University do
  before{ @uni = University.new(name: "Example University") }
  subject{ @uni }
  it{ should respond_to(:name) }
  it{ should be_valid }
  describe "when name is already taken" do
    before do
      @uni_with_same_name = @uni.dup
      @uni_with_same_name.save
    end
    it{ should_not be_valid }
  end
end
