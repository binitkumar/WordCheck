class Word < ActiveRecord::Base
  self.per_page = 1

  validates_presence_of :word_str
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


end
