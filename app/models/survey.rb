class Survey < ActiveRecord::Base
  has_many :survey_responses
  has_many :pages, :order => "'order'"
  has_many :questions, :through => :pages

  attr_accessible :name, :is_published, :before_text, :after_text

  def update_numbers
    num = 1
    self.questions.each do |q|
      q.number = num
      q.save
      num += 1
    end
  end

end
