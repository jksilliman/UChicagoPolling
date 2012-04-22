  class User < ActiveRecord::Base
    
  def self.divisions
    [
      "The College (undergraduate studies)",
      "Biological Sciences Division",
      "Chicago Booth School of Business",
      "Divinity School",
      "Graham School of Continuing Liberal and Professional Studies",
      "Harris School of Public Policy Studies",
      "Humanities Division",
      "Law School",
      "Physical Sciences Division",
      "Pritzker School of Medicine",
      "School of Social Service Administration",
      "Social Sciences Division"
    ]
  end

  def self.years
    ["1", "2", "3", "4", "5", "6+"]
  end

  def self.locations
    ["Off Campus", "Blackstone House",
      "Breckinridge House",
      "Broadview Hall",
      "Burton-Judson Courts",
      "Maclean House",
      "Max Palevsky Residential Commons",
      "Pierce Tower",
      "Snell-Hitchcock Hall",
      "South Campus Residence Hall",
      "Stony Island House", 
      "IHouse", "Grad Housing"]
  end

  validates :division, :presence => true
  validates :year, :presence => true
  validates :location, :presence => true

  validates_inclusion_of :division, :in => User.divisions
  validates_inclusion_of :year, :in => User.years
  validates_inclusion_of :location, :in => User.locations


  devise :ldap_authenticatable, :rememberable
  attr_accessible :username, :password 
  attr_accessible :username, :is_admin, :as => :admin
  attr_accessible :first_name, :last_name, :division, :year, :location, :as => :info

  validate :is_in_ldap
  def is_in_ldap
    unless Devise::LdapAdapter.get_ldap_param(self.username,"uid")
      errors.add(:username, "is not a valid CNetID")
    end
  end

  before_save :get_ldap_email
  def get_ldap_email 
    self.email = unwrap(Devise::LdapAdapter.get_ldap_param(self.username,"mail"))
  end

  def name
    unless self.first_name.blank? and self.last_name.blank? 
      self.first_name + " " + self.last_name
    else
      self.username
    end
  end


  private
  def unwrap(arr)
    (arr.kind_of?(Array)) ? arr.first : arr
  end


end
