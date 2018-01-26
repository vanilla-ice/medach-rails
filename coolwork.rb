require 'json'
file = File.read"/Users/halla/Developer/wp_posts.json"
data = JSON.parse(file)
