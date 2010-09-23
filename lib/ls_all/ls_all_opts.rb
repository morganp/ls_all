require 'optparse'
require 'ostruct'

class LsAllOpts
   #
   # Return a structure describing the options.
   #
   def self.parse(args)
      @VERSION = "0.0.1"

      # The options specified on the command line will be collected in *options*.
      # We set default values here.
      options = OpenStruct.new

      options.sort  = :normal
      options.depth = 0

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
            #puts OptionParser::Version.join('.')
            puts "Version #{@VERSION}"
            exit
         end
         opts.separator ""
         opts.separator "Specific options:"

         opts.on("-d", "--max-depth N", Integer, "Maximum traversal depth") do |n|
            options.depth = n
         end
      end

      options.leftovers = opts.parse!(args)

      return options

   end
end

