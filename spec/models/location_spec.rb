require 'spec_helper'

describe Location do
  before{ @location = Location.new(campus: "Example Campus", building: "Example Building",
    floor: "1", university_id: "1") }
  subject{ @location }

  it{ should respond_to(:campus) }
  it{ should respond_to(:building) }
  it{ should respond_to(:floor) }
  it{ should respond_to(:university_id) }

  it{ should be_valid }

  describe "when campus is not present" do
    before{ @location.campus = " " }
    it{ should_not be_valid }
  end

  describe "when floor is present but building is not" do
    before{ @location.building = " " }
    it{ should_not be_valid }
  end

  describe "when floor and building are not present" do
    before do
      @location.building = " "
      @location.floor = " "
    end
    it{ should be_valid}
  end

  describe "when university_id is not present" do
    before{ @location.university_id = " " }
    it{ should_not be_valid }
  end

end

