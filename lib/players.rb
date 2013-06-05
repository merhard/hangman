class Players
  attr_accessor :number_of, :names_list

  def initialize
    @number_of = 0
    @names_list = []
  end

  def valid_number_of_players?(number)
    number>0 && number<=5
  end

  def name_given?(name)
    name != ''
  end

  def name_already_exists?(name)
    names_list.include?(name)
  end

  def all_names_entered?
    number_of == names_list.size
  end

  def randomizer(players_list)
    players_list.shuffle
  end

end
