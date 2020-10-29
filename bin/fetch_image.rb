#!/usr/bin/env ruby
require "down"
require "fileutils"

open("./test_file.txt").each_line do |line|

    encoded_link = URI::encode(line.strip)
    puts encoded_link #image link
    tempfile = Down.download("#{encoded_link}", max_size: 5 * 1024 * 1024) # Restricting file size
    Dir.mkdir("./images") unless File.exists?("./images")
    FileUtils.mv(tempfile.path, "./images/#{tempfile.original_filename}")

end