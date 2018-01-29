# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'


Rails.application.load_tasks

desc "read file"

  task :readfile  => :environment  do
    file = File.read"./db/wp_posts.json"
    data = JSON.parse(file)
    data.each do |post|
      if post["post_content"] || post["post_title"]
        Article.create(body: post["post_content"], title: post["post_title"])
      else
        puts post["ID"] + " " + "НЕ ПОЛНЫЙ"
      end
    end

    # puts data[0].keys
    # puts "@@@@@@@@@@@@@@@"
    # puts data[23]["post_content"]
    puts "complete"
  end