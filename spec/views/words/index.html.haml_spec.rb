require 'rails_helper'

RSpec.describe "words/index", :type => :view do
  before(:each) do
    assign(:words, [
      Word.create!(
        :word_str => "Word Str",
        :num_tested => 1,
        :num_correct => 2,
        :num_correct_seq => 3,
        :num_wrong => 4
      ),
      Word.create!(
        :word_str => "Word Str",
        :num_tested => 1,
        :num_correct => 2,
        :num_correct_seq => 3,
        :num_wrong => 4
      )
    ])
  end

  it "renders a list of words" do
    render
    assert_select "tr>td", :text => "Word Str".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
