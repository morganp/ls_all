#ls_all.rb

module LsAll

   VERSION = "0.0.1"

end

Dir.chdir( File.dirname( __FILE__ ) )

require 'ls_all/ls_all.rb'
require 'ls_all/ls_all_opts.rb'
