#require "byebug"

class Image
  def initialize(rows)
    @rows = rows
  end

  def blur(distance=1)
    distance.times do 
      blur_coords
    end
  end

  def blur_coords
    blurred_coords = []
    @rows.each_with_index do |row, row_index|
      row.each_with_index do |cell, column_index|
        blurred_coords << [row_index, column_index] if cell == 1
      end
    end
# debugger
    
    blurred_coords.each do |coord|
      @rows[coord[0]][coord[1] + 1] = 1 if coord[1] + 1 <= @rows[coord[0]].length - 1
      @rows[coord[0]][coord[1] - 1] = 1 if coord[1] - 1 >= 0
      @rows[coord[0] + 1][coord[1]] = 1 if coord[0] + 1 <= @rows.length - 1
      @rows[coord[0] - 1][coord[1]] = 1 if coord[0] - 1 >= 0
      end
    end
  def output_image
    @rows.each do |row|
      puts row.join
    end
  end
end

image = Image.new([
    [0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 1],
  ])

image.blur(2)
image.output_image