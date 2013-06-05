require 'rspec'

require_relative '../lib/word'

describe 'Word' do
  let(:example_word) {'hello'}
  let(:word) {Word.new(example_word)}

  it 'sets a word' do
    expect(word.current_word).to eq(example_word)
  end

  it 'sets a randomly generated word if no word is specified' do
    word1 = Word.new
    word2 = Word.new

    expect(word1.current_word).to_not eq(word2.current_word)
  end

  it 'can turn a word into an array of hashes' do
    test_word = 'win'
    expected_hash = [{"w"=>"_"}, {"i"=>"_"}, {"n"=>"_"}]

    expect(word.hasher(test_word)).to eq(expected_hash)
  end

  it 'returns a blank version of the word' do
    expect(word.display_current_game).to eq('_ _ _ _ _ ')
  end

  it 'checks if letter guess is in word' do
    expect(word.in_word?('h')).to be true
    expect(word.in_word?('a')).to be false
  end

  it 'checks if case-insensitive letter guess is in word' do
    expect(word.in_word?('H')).to be true
    expect(word.in_word?('A')).to be false
  end

  it 'can replace blanks with a correctly guessed letter' do
    word.replace_blank_with_letter('h')
    expect(word.display_current_game).to include('h')
  end

  it 'checks if letter was already guessed' do
    word.guessed_letters << 'e'
    expect(word.already_guessed?('h')).to be false
    expect(word.already_guessed?('e')).to be true
  end

  it 'checks if guessed word is correct' do
    expect(word.correct_word?('world')).to be false
    expect(word.correct_word?(example_word)).to be true
  end

end
