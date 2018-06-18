class Customer

  attr_reader( :id, :badge_number, :name)

  def initialize( options )
    @badge_number = options['badge_number'].to_i
    @name = options['name']
  end

end
