require 'rails_helper'

RSpec.describe "words/edit", :type => :view do
  before(:each) do
    @word = assign(:word, Word.create!(
      :word_str => "MyString",
      :num_tested => 1,
      :num_correct => 1,
      :num_correct_seq => 1,
      :num_wrong => 1
    ))
  end

  it "renders the edit word form" do
    render

    assert_select "form[action=?][method=?]", word_path(@word), "post" do

      assert_select "input#word_word_str[name=?]", "word[word_str]"

      assert_select "input#word_num_tested[name=?]", "word[num_tested]"

      assert_select "input#word_num_correct[name=?]", "word[num_correct]"

      assert_select "input#word_num_correct_seq[name=?]", "word[num_correct_seq]"

      assert_select "input#word_num_wrong[name=?]", "word[num_wrong]"
    end
  end
end
