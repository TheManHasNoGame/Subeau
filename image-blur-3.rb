require "byebug"

class Image
  def initialize(rows)
    @rows = rows
  end

  def blur
    @rows_copy = Array.new(@rows.size) {Array.new(@rows.first.size)}
    @rows.each_with_index do |row, row_index|
      row.each_with_index do |cell, column_index|
        @rows_copy[row_index][column_index] = 0
      end
    end

    @rows.each_with_index do |row, row_index|
# debugger
      row.each_with_index do |cell, column_index|
        blur_location(row_index,column_index)
      end
    end
    @rows = @rows_copy
  end
   
  def blur_location (row_index, column_index)
    if @rows[row_index][column_index] == 1
        @rows_copy[row_index][column_index] = 1
      #checks below
      if row_index != @rows_copy[row_index].size - 1
         @rows_copy[row_index + 1][column_index] = 1
      end
      #checks above
      if row_index != 0
        @rows_copy[row_index - 1][column_index] = 1
      end
      # checks to the right
      if column_index != @rows_copy[row_index].size - 1
        @rows_copy[row_index][column_index + 1] = 1
      end
      #checks to the left
      if column_index != 0
        @rows_copy[row_index][column_index - 1] = 1
      end
    end
  end
  def output_image
    @rows.each_with_index do |row, row_index|
      puts row.join
    end
  end
end

image = Image.new([
    [0, 0, 0, 0, 0, 0,],
    [0, 0, 0, 0, 0, 0,],
    [0, 0, 0, 0, 0, 0,],
    [0, 0, 0, 0, 0, 0,],
    [0, 0, 0, 0, 0, 0,],
    [0, 0, 0, 0, 0, 0,],
  ])

image.blur
image.output_image