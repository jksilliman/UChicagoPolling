class Page < ActiveRecord::Base
  belongs_to :survey
  has_many :questions, :order => :number

  attr_accessible :title, :description, :order
end
