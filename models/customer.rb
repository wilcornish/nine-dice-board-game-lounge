class Customer

  attr_reader( :id, :badge_number, :name)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @badge_number = options['badge_number'].to_i
    @name = options['name']
  end

end
