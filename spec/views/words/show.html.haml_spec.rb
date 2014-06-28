require 'rails_helper'

RSpec.describe "words/show", :type => :view do
  before(:each) do
    @word = assign(:word, Word.create!(
      :word_str => "Word Str",
      :num_tested => 1,
      :num_correct => 2,
      :num_correct_seq => 3,
      :num_wrong => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Word Str/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
