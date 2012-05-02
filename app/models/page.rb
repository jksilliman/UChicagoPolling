class Page < ActiveRecord::Base
  belongs_to :survey
  has_many :questions, :order => :number

  attr_accessible :title, :description, :order

  after_save :update_numbers
  def update_numbers
    self.survey.update_numbers
  end
end
