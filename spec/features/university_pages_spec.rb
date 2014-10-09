require 'spec_helper'

describe "University pages" do
  subject{ page }
  let(:university) { FactoryGirl.create(:university) }

  describe "show page" do
    before{ visit university_path(university) }
    it{ should have_content(university.name) }
    it{ should have_title(full_title(university.name)) }
    describe "user count" do
      before do
        university.users << FactoryGirl.create(:user)
        university.users << FactoryGirl.create(:user)
        visit university_path(university)
      end
      it{ should have_content("2 users") }
    end
  end
end
