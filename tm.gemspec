# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','tm','version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 'tm'
  s.version = Tm::VERSION
  s.author = 'Your Name Here'
  s.email = 'your@email.address.com'
  s.homepage = 'http://your.website.com'
  s.platform = Gem::Platform::RUBY
  s.summary = 'A description of your project'
# Add your other files here if you make them
  s.files = %w(
bin/tm
lib/tm/version.rb
lib/tm.rb
  )
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','tm.rdoc']
  s.rdoc_options << '--title' << 'tm' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'tm'
  s.add_dependency('taskmapper')
  s.add_dependency('taskmapper-kanbanpad')
  s.add_dependency('rainbow')
  s.add_dependency('terminal-table')

  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('rspec')
  s.add_development_dependency('aruba')
  s.add_runtime_dependency('gli','2.5.5')
end
