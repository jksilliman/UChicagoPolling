class Poll < ActiveRecord::Base
  has_many :responses, :inverse_of => :poll, :dependent => :destroy

  def answers
    @answers ||= ActiveSupport::JSON.decode(self.answers_data)
  end

  def answers= data
    self.answers_data = data.to_json
    @answers = nil
    self.answers
  end

  def response_for user
    self.responses.find_by_user_id(user.id)
  end

  def is_valid_answer? answer
    self.answers.keys.include? answer
  end

  def num_responses_for answer
    unless @responses
      @responses ||= Response.find(:all, 
        :select => "count(*) count, answer",
        :group => 'answer',
        :conditions => {:poll_id => self.id})
      @response_hash = {}
      @responses.each do |response|
        @response_hash[response.answer] = response.count
      end
    end
    @response_hash[answer]
  end
end
