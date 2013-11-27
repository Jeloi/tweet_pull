require "csv"

desc "Generate person records from given csv file"
task :generate_person_records => :environment do
	csv_text = File.read(Rails.root.to_s+"/"+"input.csv")
	csv = CSV.parse(csv_text, :headers => true)
	csv.each do |row|
		puts row
	  	Person.create!(row.to_hash)
	end	
end

desc "Pull tweets for all persons"
task :pull_tweets => :environment do
	n = YAML::load_file("config/twitter_info.yml")
	client = Twitter::REST::Client.new do |config|
	  config.consumer_key        = n["consumer_key"].to_s
	  config.consumer_secret     = n["consumer_secret"]
	  config.access_token        = n["access_token"]
	  config.access_token_secret = n["access_token_secret"]
	end

	MAX_NUM_TWEETS = 3200
	NUM_TWEETS_PER_PAGE = 200.0

	Person.all.each do |person|
		if !person.username.nil? and person.tweets.empty?
			username = person.username
			# tweets_count = client.user(username).tweets_count

			# num_pages = ([MAX_NUM_TWEETS, tweets_count].min/NUM_TWEETS_PER_PAGE).ceil
			page_num = 5
			puts "#{username}"

			# x = client.user_timeline(username, count: 200)
			# for i in(0..x.length-1)
			#     tweet = person.tweets.build
			#     tweet.text = x[i].text
			#     tweet.save
			# end
			# last_id = x.last.id-1  
			
			while page_num > 0
				x = client.user_timeline(username, count: 200, page: page_num)
				puts page_num
				for i in(0..x.length-1)
				    tweet = person.tweets.build
				    tweet.text = x[i].text
				    tweet.save
				end
				# if x.last.nil?
				# 	break
				# else

				# end
				# last_id = x.last.id-1
				page_num -= 1
			end
			# while prev_id != last_id do
			# 	a = client.user_timeline(username, max_count: 200, max_id: last_id)
			#     for i in(0..x.length-1)
			#     	tweet = person.tweets.build
			#     	tweet.text = a[i].text
			#     	tweet.save
			#     end

			#     prev_id = last_id
			#     last_id = a.last.id
			# end
		end
	end
end