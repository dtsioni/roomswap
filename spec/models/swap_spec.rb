require 'spec_helper'
describe Swap do
  before{ @swap = Swap.new(user_id: "1", origin_id: "1") }
  subject{ @swap }

  it{ should respond_to(:user_id) }
  it{ should respond_to(:origin_id) }

  it{ should be_valid }

  describe "when user_id is already taken" do
    before do
      @swap_with_same_user = @swap.dup
      @swap_with_same_user.save
    end
    it{ should_not be_valid }
  end

end