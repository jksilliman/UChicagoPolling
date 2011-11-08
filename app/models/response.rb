class Response < ActiveRecord::Base
  belongs_to :poll, :inverse_of => :responses
  belongs_to :user

  validate :only_one_response
  def only_one_response
    other = self.poll.responses.find_by_user_id(self.user_id)
    errors.add(:user_id, "You cannot respond more than once to a questions") if other
  end

  validate :valid_answer
  def valid_answer
    unless self.poll.is_valid_answer? self.answer
      errors.add(:answer, "Not a valid answer")
    end
  end

end
