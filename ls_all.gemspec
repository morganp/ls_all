require 'rake/gempackagetask'

NAME="ls_all"

spec = Gem::Specification.new do |s|
   s.name      = NAME
   s.version   = '0.0.1'
   s.platform  = Gem::Platform::RUBY
  
   s.homepage  = "http://amaras-tech.co.uk/software/#{NAME}"
   s.authors   = "Morgan Prior"
   s.email     = "#{NAME}_gem@amaras-tech.co.uk"
   
   s.summary   = 'ls_all is a command line tool to list folder contents to a specific depth'
   s.description = "ls_all is an executable (command line) tool used to hierarchically list a folders contents."
   
   s.files     =  Dir.glob("lib/**/*") 
   s.files     += ["bin/#{NAME}"]
   s.bindir    = 'bin'
   s.executables = [NAME]
   s.has_rdoc  = false

end
Rake::GemPackageTask.new(spec).define

