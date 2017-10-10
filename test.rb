require 'set'
class CarModelsAndMakes
	def initialize(file1,file2)
		if file1.include?("makes")
			@carmakes = file1+".rb"
			@carmodels = file2+".rb"
		else
			@carmakes = file2+".rb"
			@carmodels = file1+".rb"
		end
	end

	def showcarmakes
		txt = open(@carmakes)
		txt.read.split(" ")
	end

	def showmodelmakes
		txt = open(@carmodels)
		arr = txt.read.split("\n")
		carmakes = []
		arr.each{|a| carmakes.push(a.split("="))}
		carmakes
	end

	def hashcity
		makes = showcarmakes
		models = showmodelmakes
		carhash = Hash.new
		makes.each {|a|
			carhash[a.to_sym] = Set.new []
		}
		models.each {|element,b|
			carhash.keys.each{|a|
				if a.to_s[0] == element
					carhash[a.to_sym]<<(b)
				end
			}
		}
		carhash
	end
end

puts "What is the car make filename without the extension?"
file1 = gets.chomp
puts "What is the car model filename without the extension?"
file2 = gets.chomp
car =  CarModelsAndMakes.new(file1,file2)
puts car.hashcity