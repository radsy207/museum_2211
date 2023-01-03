class Museum
  attr_reader :name,
              :exhibits,
              :patrons
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    patron.interests
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    # {exhibit => patron}
    x = Hash.new()
    @exhibits.each do |exhibit|
      x[exhibit] = @patrons.map { |patron| patron.interests.include?(exhibit)}
			# @patrons.each do |patron|
			# 	if patron.interests.include?(exhibit)			
			# 		patrons_by_exhibit_interest[exhibit] << patron
      #   end
      # end
    end

  end

end