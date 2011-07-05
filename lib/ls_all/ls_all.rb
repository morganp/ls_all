#!/usr/bin/env ruby

require 'rubygems'
require 'slop'

module LsAll
  class LsAll

    def initialize( options )
      @max_depth = options["max_depth"] ||= 0
      @count     = options["count"] ||= false
    end

    def list_files( files, spacer='|', path='.', depth=1)
      path = File.expand_path( path )

      files.each do |f|
        if File.directory?( f )

          file_string= f + '/'
          if  (not @max_depth == 0) and (depth == @max_depth) and (@count == true)
            puts spacer + '--' + file_string.ljust(20) + ' Count: ' + file_count( f )
          else
            puts spacer + '-- ' + file_string   
          end


          recursive_path=File.expand_path( f )
          Dir.chdir( recursive_path )
          recursive_files = Dir.glob('*')
          recursive_spacer = spacer + '   |'

          if (@max_depth == 0) or (depth < @max_depth)
            rec_depth=depth+1 
            list_files(recursive_files, recursive_spacer, recursive_path, rec_depth)
          else
            #
          end
        else
          puts spacer + '-- ' + f
        end
        Dir.chdir( path )
      end

    end

    def file_count( path )
      recursive_files = Dir.glob(path + '/*')
      recursive_files.size.to_s
    end
  end
end


