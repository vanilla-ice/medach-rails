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
    data.reverse!.each do |post|
      if post["post_content"].present? && post["post_title"].present? && post["post_status"] === "publish" && post["post_parent"] === '0'
         short = post["post_title"].slice(0, 150).gsub(/<[a-zA-Z\/][^>]*>/, '')

         Article.create(
            body: post["post_content"].gsub(/\[[^\]]*\]/, ''),
            title: post["post_title"], publish_on: Time.zone.now,
            search: post["ID"], shorttext: short,
            author: "old.medach.pro"
            )
      else
        puts post["ID"] + " " + "НЕ ПОЛНЫЙ"
      end
        
      if post["post_type"] === "attachment" && post["post_parent"] != '0'
         
        kek = Article.find_by(search: post["post_parent"])
        unless kek.nil?
          kek.update(remote_image_url: post["guid"])
        else
          puts "nil"
        end
        
      else
        puts "jopa"
      end

    puts "complete "
  end
end