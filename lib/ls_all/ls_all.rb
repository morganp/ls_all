#!/usr/bin/env ruby

require 'rubygems'
require 'ls_all_opts'

class LsAll

   def initialize( max_depth=0 )
      @max_depth = max_depth
   end

   def list_files( files, spacer='', path='.', depth=1)
      path = File.expand_path( path )

      files.each do |f|
         if File.directory?( f )

            puts spacer + f + '/'   

            recursive_path=File.expand_path( f )
            Dir.chdir( recursive_path )
            recursive_files = Dir.glob('*')
            recursive_spacer = spacer + ' '

            if (@max_dpeth == 0) or (depth < @max_depth)
               rec_depth=depth+1
               list_files(recursive_files, recursive_spacer, recursive_path, rec_depth)
            else 
               #puts spacer + f
            end
         else
            puts spacer + f
         end
         Dir.chdir( path )
      end

   end
end

if $0 == __FILE__
   options = LsAllOpts.parse(ARGV)
   list    = LsAll.new( options.depth )

   #Dir.chdir( path ) 
   files = Dir.glob('*')
   list.list_files( files )
end
