class SurveyResponse < ActiveRecord::Base
  
  def load_answers
    if self.answers.empty?
      self.answers = "{}"
    end
    @answers ||= ActiveSupport::JSON.decode(self.answers)
  end  
  def modify_answer(q_id, answer)
    load_answers
    @answers[q_id.to_s] = answer
  end


  before_save :jsonify
  def jsonify
    load_answers
    self.answers = @answers.to_json
  end



end
