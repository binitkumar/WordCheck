require 'rails_helper'

RSpec.describe "words/new", :type => :view do
  before(:each) do
    assign(:word, Word.new(
      :word_str => "MyString",
      :num_tested => 1,
      :num_correct => 1,
      :num_correct_seq => 1,
      :num_wrong => 1
    ))
  end

  it "renders new word form" do
    render

    assert_select "form[action=?][method=?]", words_path, "post" do

      assert_select "input#word_word_str[name=?]", "word[word_str]"

      assert_select "input#word_num_tested[name=?]", "word[num_tested]"

      assert_select "input#word_num_correct[name=?]", "word[num_correct]"

      assert_select "input#word_num_correct_seq[name=?]", "word[num_correct_seq]"

      assert_select "input#word_num_wrong[name=?]", "word[num_wrong]"
    end
  end
end
