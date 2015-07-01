require 'rubygems'
require './app/data_mapper_setup'
require File.join(File.dirname(__FILE__), 'app/bookmark_manager.rb')
# __FILE__ is like a variable taht returns the path of the current file
# Take the directory name of the current file and append to that 'app/bookmark_namanger.rb'. It's pretty much
# the same as the require but this strcuture lets you require a whole directory if you want to. See join in the
# controller file that brings the views directory in there.

run BookmarkManager

# WHEN YOU TYPE RACKUP, IT READS THIS FILE. THIS FILE HAS TO BE CALLED CONFIG.RU AND BE IN THE ROOT
# OF THE APP DIRECTORY FOR THE COMMAND 'RACKUP' IN IRB/PRY TO WORK.
