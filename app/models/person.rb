class Person < ActiveRecord::Base
	has_many :tweets

	TWELVE_PEOPLE = [2,3,4,5,7,8,9,10,11,14,15,16]

	def self.write_data_by_labels file_name_param=nil, number_examples=nil
		file_name = file_name_param || "output_by_labels.txt"
		File.open(Rails.root.to_s + "/" + file_name, "w") do |file|
			Person.order("label_number").each do |person|
				if number_examples
					person.tweets.limit(number_examples).each do |tweet|
						if (tweet.text =~ /^RT/).nil?
							file.puts "#{person.id.to_i}  #{tweet.text}"
						end
					end
				else
					person.tweets.each do |tweet|
						if (tweet.text =~ /^RT/).nil?
							file.puts "#{person.id.to_i} #{tweet.text}"
						end
					end
				end
			end
		end
	end

	def self.write_data_by_people file_name_param=nil, number_examples=nil
		file_name = file_name_param || "output_by_people.txt"
		File.open(Rails.root.to_s + "/" + file_name, "w") do |file|
			Person.where(id: [3,8, 10, 14]).order("id").each do |person|
				if number_examples
					person.tweets.limit(number_examples).each do |tweet|
						if (tweet.text =~ /^RT/).nil?
							file.puts "#{person.id.to_i}  #{tweet.text}"
						end
					end
				else
					person.tweets.limit(number_examples).each do |tweet|
						if (tweet.text =~ /^RT/).nil?
							file.puts "#{person.id.to_i} #{tweet.text}"
						end
					end
				end
			end
		end
	end

	def self.twelve_people_by_group file_name_param=nil, number_examples=nil
		file_name = file_name_param || "output_by_people.txt"
		File.open(Rails.root.to_s + "/" + file_name, "w") do |file|
			Person.where(id: TWELVE_PEOPLE).order("id").each do |person|
				if number_examples
					person.tweets.limit(number_examples).each do |tweet|
						file.puts "#{person.label_number.to_i}  #{tweet.text}"
					end
				else
					person.tweets.limit(number_examples).each do |tweet|
						file.puts "#{person.label_number.to_i} #{tweet.text}"
					end
				end
			end
		end
	end

	def self.twelve_people_by_user file_name_param=nil, number_examples=nil
		file_name = file_name_param || "output_by_people.txt"
		File.open(Rails.root.to_s + "/" + file_name, "w") do |file|
			Person.where(id: TWELVE_PEOPLE).order("id").each do |person|
				if number_examples
					person.tweets.limit(number_examples).each do |tweet|
						file.puts "#{person.id.to_i}  #{tweet.text}"
					end
				else
					person.tweets.limit(number_examples).each do |tweet|
						file.puts "#{person.id.to_i} #{tweet.text}"
					end
				end
			end
		end
	end
end
