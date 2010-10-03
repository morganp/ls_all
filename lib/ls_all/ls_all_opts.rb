require 'optparse'
require 'ostruct'

module LsAll
   class LsAllOpts
      #
      # Return a structure describing the options.
      #
      def self.parse(args)
         #VERSION is held in top level LSAll::VERSION
         @VERSION = VERSION

         # The options specified on the command line will be collected in *options*.
         # We set default values here.
         options = OpenStruct.new

         options.sort  = :normal
         options.depth = 0
         options.count = false
         options.path  = '.'

         opts = OptionParser.new do |opts|
            opts.banner = "Usage: #{__FILE__} [options]"
            opts.separator ""
            opts.separator "Common options:"

            # No argument, shows at tail. This will print an options summary.
            opts.on("-h", "--help", "Show this message") do
               puts opts
               exit
            end

            # Another typical switch to print the version.
            opts.on("--version", "Show version") do
               puts "Version #{@VERSION}"
               exit
            end
            opts.separator ""
            opts.separator "Specific options:"

            opts.on("-d", "--max-depth N", Integer, "Maximum traversal depth") do |n|
               options.depth = n
            end

            opts.on("-c", "--count", "return file count for max depth of folder" ) do |n|
               options.count = n
         end
      end

      options.leftovers = opts.parse!(args)
      if options.leftovers.size > 0
         if File.exists?(  File.expand_path( options.leftovers[0] ) )
            options.path = File.expand_path( options.leftovers[0] )
         end
      end

      return options

   end
end
end

