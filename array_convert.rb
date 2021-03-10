class ArrayConvert
  attr_accessor :arr_result

  def initialize
    @arr_result = []
  end

  def convert(arr_input)
    arr_input.each do |arr_item|
      if arr_item.is_a? Array
        convert(arr_item)
      else
        @arr_result << arr_item
      end
    end
  end
end

a1 = [[1,2],[[3,4],5],[6,7]]
converter = ArrayConvert.new
converter.convert a1
a2= converter.arr_result
puts "#{a2}"
