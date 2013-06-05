require 'rspec'

require_relative '../lib/players'


describe "Players" do
  let(:players){Players.new}

  it 'does not allow less than 1 player' do
    expect(players.valid_number_of_players?(1)).to be true
    expect(players.valid_number_of_players?(0)).to be false
  end

  it 'does not allow more than 5 players' do
    expect(players.valid_number_of_players?(5)).to be true
    expect(players.valid_number_of_players?(6)).to be false
  end

  it 'must specify a name' do
    expect(players.name_given?('')).to be false
  end

  it 'must have a unique name for each player' do
    players.names_list = ['John']
    expect(players.name_already_exists?('John')).to be true
  end

  it 'has all names entered before the game starts' do
    players.number_of = 2
    players.names_list = ['player']
    expect(players.all_names_entered?).to be false

    players.names_list = ['player1', 'player2']
    expect(players.all_names_entered?).to be true
  end

  it 'is random what user plays when' do
    list = ['player1', 'player2', 'player3']
    random_list = players.randomizer(list)
    expect(random_list.object_id).to_not eq(list.object_id)
  end

end
