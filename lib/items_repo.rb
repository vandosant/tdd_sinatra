class ItemsRepo
  attr_reader :items_hash

  def initialize
    @items_array = []
    @items_hash = Hash.new
  end

  def add(item_name)
    @items_array << item_name
    @id = @items_array.length
    @items_hash[@id] = item_name
  end
end