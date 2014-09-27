require 'spec_helper'
describe Swap do
  before{ @swap = Swap.new(user_id: "1", destination_id: "1", origin_id: "1", location_id: "1") }
  subject{ @swap }

  it{ should respond_to(:user_id) }
  it{ should respond_to(:destination_id) }
end