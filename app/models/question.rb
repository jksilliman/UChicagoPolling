class Question < ActiveRecord::Base
  belongs_to :page

  validates_associated :page
  validates_presence_of :page

  def options
    @options ||= ActiveSupport::JSON.decode(self.options_data)
  end

  def valid_answer?(a)
    if options["required"]
      not (a.nil? || a.empty?)
    else
      true
    end
  end

end
