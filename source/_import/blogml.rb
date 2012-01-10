module Jekyll

  require 'rexml/document'
  require 'time'
  require "YAML"
  require 'fileutils'

  module BlogML
    #Reads posts from an BlogML dump.
    #It creates a post file for each entry in the dump.
    def self.process(source = "BlogML.xml")
      FileUtils.rmtree "_posts"
      FileUtils.mkdir_p "_posts"
      content = ""
      open(source, "r") { |f| content << f.read }
      
      FileUtils.touch ".htaccess"
      File.open(".htaccess", "w") do |htaccess|
      
        htaccess.puts "RewriteEngine on"
      
        doc = REXML::Document.new(content)
        posts = 0
        doc.elements.each("blog/posts/post") do |item|
          link = item.attributes["post-url"]
        
          # Use the URL after the last slash as the post's name
          name = link.split("/")[-1]
          puts "name 1: #{name}"
          
          # Lowercase name for uniformity
          name.downcase!
          
          # Keep old URL
          old_url = name
          # htaccess.puts "RewriteRule ^#{name}$ "
          
          # Remove extensions (.html, .aspx, etc)
          name = $1 if name =~ /(.*)\.(.*)/
          puts "name 2: #{name}"
        
          # # Remove the leading digits and dash that Serendipity adds
          # name = $1 if name =~ /\d+\-(.*)/
          # puts "name 3: #{name}"
        
          puts "name: #{name}"
      
          title = item.elements["title"].text
          puts "title: #{title}"
              
          content = item.elements["content"].text        
        
          # Replace /image.axd?picture= with /images/
          content.gsub!(/\/image\.axd\?picture\=/, "/images/")
          # Replace /file.axd?file= with /files/
          content.gsub!(/\/file\.axd\?file\=/, "/files/")
          # Replace encoded /'s with real thing
          content.gsub!(/\%2f/, "/")
        
          timestamp = Time.parse(item.attributes["date-created"])
          puts "timestamp: #{timestamp}"
          
          # post_file_name = "#{timestamp.strftime("%Y-%m-%d")}-#{name}"
          filename = "_posts/#{timestamp.strftime("%Y-%m-%d")}-#{name}.html"
          puts "filename: #{filename}"
        
          # Add URL rewrite to htaccess
          htaccess.puts "RewriteRule ^post/#{old_url}$ /#{name}.html [R=301,NC]"
        
          # puts "#{link} -> #{filename}"
          File.open(filename, "w") do |f|
            # YAML.dump(
            #   {
            #     "layout" => "default",
            #     # "name" => name,
            #     "title" => title,
            #     # "time" => timestamp,
            #   },
            f.puts <<-HEADER
---
layout: post
title: "#{title}"
comments: true
---
            HEADER
            # f.puts
            # )
            # f.puts "---\n#{content}"
            f.puts content
          end
          
          posts += 1
        end
        puts "Created #{posts} posts!"
        
      end
    end
  end
end
