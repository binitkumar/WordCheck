class Word < ActiveRecord::Base
  self.per_page = 1

  validates_uniqueness_of :word_str
  has_many :user_responses
  
  def self.question_set(page_no = nil)
    page_no = 1 if page_no.nil?
    question = all.order(:id).paginate(page: page_no).first

    answer_options = all.sample(3)
    answer_options.to_a.push question
    answers = answer_options.shuffle

    question_set = Hash.new
    question_set[question.word_str] = answers
    question_set
  end

  def mark_answer(answer)
    if self.word_str == answer
      self.correct_answer_increment
      return true
    else
      self.wrong_answer_increment
      return false
    end
  end

  def correct_answer_increment
    self.update_attribute(:num_correct, self.num_correct.to_i + 1)
    self.update_attribute(:num_correct_seq, self.num_wrong.to_i + 1)
  end

  def wrong_answer_increment
    self.update_attribute(:num_wrong, self.num_wrong.to_i + 1)
  end
end
