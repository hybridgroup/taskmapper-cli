# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','tm','version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 'taskmapper-cli'
  s.version = Tm::VERSION
  s.author = 'Rafael George'
  s.email = 'george.rafael@gmail.com'
  s.homepage = 'http://github.com/cored'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Command line interface for TaskMapper'
# Add your other files here if you make them
  s.files = %w(
bin/tm
lib/tm/version.rb
lib/tm/string_extensions.rb
lib/tm/exceptions.rb
lib/tm/provider_handler.rb
lib/tm/format/format.rb
lib/tm/format/csv.rb
lib/tm/format/pretty.rb
lib/tm/format/table.rb
lib/tm/commands/command.rb
lib/tm/commands/create_comment.rb
lib/tm/commands/create_task.rb
lib/tm/commands/first_project.rb
lib/tm/commands/first_task.rb
lib/tm/commands/generate_provider.rb
lib/tm/commands/last_project.rb
lib/tm/commands/last_task.rb
lib/tm/commands/list_all_comments_for_task.rb
lib/tm/commands/list_all_projects.rb
lib/tm/commands/list_all_tasks.rb
lib/tm/commands/single_project.rb
lib/tm/commands/single_task.rb
lib/tm.rb
  )
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','tm.rdoc']
  s.rdoc_options << '--title' << 'tm' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'tm'
  s.add_dependency('taskmapper')
  s.add_dependency('taskmapper-basecamp')
  s.add_dependency('taskmapper-github')
  s.add_dependency('taskmapper-bugherd')
  s.add_dependency('taskmapper-bugzilla')
  s.add_dependency('taskmapper-fogbugz')
  s.add_dependency('taskmapper-kanbanpad')
  s.add_dependency('taskmapper-lighthouse')
  s.add_dependency('taskmapper-pivotal')
  s.add_dependency('taskmapper-rally')
  s.add_dependency('taskmapper-redmine')
  s.add_dependency('taskmapper-trac')
  s.add_dependency('taskmapper-unfuddle')
  s.add_dependency('taskmapper-zendesk')

  s.add_dependency('rainbow')
  s.add_dependency('terminal-table')

  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('rspec')
  s.add_development_dependency('aruba')
  s.add_runtime_dependency('gli','2.5.5')
end
