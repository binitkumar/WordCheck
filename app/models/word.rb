class Word < ActiveRecord::Base

  validates_uniqueness_of :word_str
  has_many :user_responses
  
  def self.question_set
    words = all.sample(4)
    question = words.first
    answers = words.shuffle
    question_set = Hash.new
    question_set[question.word_str] = answers
    question_set
  end

  def correct_answer_increment
    self.update_attribute(:num_correct, self.num_correct.to_i + 1)
    self.update_attribute(:num_correct_seq, self.num_wrong.to_i + 1)
  end

  def wrong_answer_increment
    self.update_attribute(:num_wrong, self.num_wrong.to_i + 1)
  end
end
