json.array!(@words) do |word|
  json.extract! word, :id, :word_str, :num_tested, :num_correct, :num_correct_seq, :num_wrong, :first_tested, :last_tested
  json.url word_url(word, format: :json)
end
