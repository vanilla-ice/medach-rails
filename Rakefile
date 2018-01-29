# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'
require 'uri'

# http([\w\W]+?).jpg
Rails.application.load_tasks

desc "read file"

  task :readfile  => :environment  do
    file = File.read"./db/wp_posts.json"
    data = JSON.parse(file)
    data.take(60).each do |post|
      if post["post_content"].empty? && post["post_title"].empty?
        puts post["ID"] + " " + "НЕ ПОЛНЫЙ"
      else
        Article.create(body: post["post_content"], title: post["post_title"], publish_on: Time.zone.now )
      end

    #   link = post["post_content"].match(URI.regexp).select { |x| x =~ /^http.*\.jpg$/}
    #  puts link.inspect

  end

    # puts data[0].keys
    # puts "@@@@@@@@@@@@@@@"
    # puts data[23]["post_content"]
    puts "complete "
  end