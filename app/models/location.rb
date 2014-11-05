class Location < ActiveRecord::Base
  belongs_to :university
  has_many :residents, class_name: "User",
    foreign_key: "home_id"
  has_and_belongs_to_many :migrators, class_name: "User",
    join_table: "locations_users", foreign_key: "migrator_id",
    association_foreign_key: "target_id"
  has_and_belongs_to_many :incoming_swaps, class_name: "Swap",
    join_table: "locations_swaps", foreign_key: "incoming_swap_id",
    association_foreign_key: "destination_id"
  validates :university_id, presence: true
  validates :campus, presence: true
  validates :floor, absence: true, unless: :building?  

  CAMPUSES = ["anywhere", "livingston", "college avenue", "busch", "cook/douglass"]

  BUILDINGS_LIVINGSTON = ["anywhere", "livingston apartments", "lynton towers north", "lynton towers south", "quad 1", "quad 2", "quad 3"]
  BUILDINGS_BUSCH = ["anywhere", "allen hall", "barr hall", "best", "crosby suites", "davidson hall", "judson suites", "mattia hall", "mccormick suites", "metzger hall", "morrow suites", "nichols apartments", "richardson apartments", "silvers apartments", "thomas suites", "winkler suites", "marvin apartments", "buell apartments", "johnson apartments"]
  BUILDINGS_COLLEGE_AVENUE = ["anywhere", "brett hall", "campbell hall", "clothier hall", "demarest hall", "frelinghuysen hall", "hardenbergh hall", "hegeman hall", "leupp hall", "mettler hall", "pell hall", "stonier hall", "tinsley hall", "university center at easton ave apartments", "wessels hall"]
  BUILDINGS_COOK_DOUGLASS = ["anywhere", "heylar house", "henderson apartments", "jameson hall", "katzenbach hall", "lippincott hall", "new gibbons hall", "newell apartments", "nicholas hall", "old gibbons hall", "perry hall", "voorhees hall", "woodbury bunting-cobb hall", "starkey apartments"]

  FLOORS_LIVINGSTON = {"livingston apartments" => 5, "lynton towers north" => 7, "lynton towers south" => 7, "quad 1" => 5, "quad 2" => 5, "quad 3" => 5}
  FLOORS_BUSCH = {"allen hall" => 4, "barr hall" => 4, "best" => 4, "crosby suites" => 4, "davidson hall" => 1, "judson suites" => 4, "mattia hall" => 4, "mccormick suites" => 10, "metzger hall" => 4, "morrow suites" => 4, "nichols apartments" => 3, "richardson apartments" => 3, "silvers apartments" => 4, "thomas suites" => 4, "winkler suites" => 4, "marvin apartments" => 3, "buell apartments" => 3, "johnson apartments" => 2}
  FLOORS_COLLEGE_AVENUE = {"brett hall" => 4, "campbell hall" => 6, "clothier hall" => 6, "demarest hall" => 3, "frelinghuysen hall" => 6, "hardenbergh hall" => 6, "hegeman hall" => 3, "leupp hall" => 3, "mettler hall" => 4, "pell hall" => 3, "stonier hall" => 5, "tinsley hall" => 4, "university center at easton ave apartments" => 7, "wessels hall" => 3}
  FLOORS_COOK_DOUGLASS = {"heylar house" => 2, "henderson apartments" => 4, "jameson hall" => 3, "katzenbach hall" => 4, "lippincott hall" => 4, "new gibbons hall" => 3, "newell apartments" => 2, "nicholas hall" => 3, "old gibbons hall" => 3, "perry hall" => 4, "voorhees hall" => 4, "woodbury bunting-cobb hall" => 3, "starkey apartments" => 3}


end