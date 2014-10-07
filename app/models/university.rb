class University < ActiveRecord::Base
  has_many :users
  has_many :locations
  validates_uniqueness_of :name
  
  #returns the default university
  #currently Rutgers New Brunswick
  def self.default
    uni = University.find_by(name: "Rutgers University - New Brunswick")
    uni ? uni : University.create(name: "Rutgers University - New Brunswick")
  end

end