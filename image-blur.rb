#require 'byebug'

class Image

	def initialize(arg_passed_in)
		@value = arg_passed_in
	end


	def output_image
		@value.each do |sub|
			puts sub.join
		end
	end
end
#debugger
image = Image.new([
		[0, 0, 0, 0],
		[0, 1, 0, 0],
		[0, 0, 0, 1],
		[0, 0, 0, 0]
	])

image.output_image
