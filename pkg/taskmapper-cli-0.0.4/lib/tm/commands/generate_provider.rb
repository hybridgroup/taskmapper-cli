require 'fileutils'

module TM
  module Commands
    class GenerateProvider
      class << self
        def create(provider_name)
          short_name = provider_name
          provider_name = "taskmapper-#{provider_name}"
          FileUtils.mkdir_p "#{provider_name}/lib/provider"
          create_readme(provider_name)
          create_gemfile(provider_name)
          create_version_file(provider_name, short_name)
          create_rakefile(provider_name)
          create_lib_file(provider_name, short_name)
          create_provider_file(provider_name, short_name)
          create_project_file(provider_name, short_name)
          create_ticket_file(provider_name, short_name)
          create_comment_file(provider_name, short_name)
          create_gemspec(provider_name, short_name)
        end

        private 
        def provider_lib_path(provider_name)
          "#{provider_name}/lib"
        end

        def create_gemfile(provider_name)
          File.open("#{provider_name}/Gemfile", "w") do |file|
            file.puts <<EOS
source 'https://rubygems.org'
gemspec
EOS
          end
          puts "Created #{provider_name}/Gemfile"
        end

        def create_rakefile(provider_name)
          File.open("#{provider_name}/Rakefile", "w") do |file|
            file.puts <<EOS
require 'rake/clean'
require 'rdoc/task'
require 'bundler/gem_tasks'

Rake::RDocTask.new do |rd|
  rd.main = "README.rdoc"
  rd.rdoc_files.include("README.rdoc","lib/**/*.rb")
  rd.title = 'Your application title'
end

EOS
          end
          puts "Created #{provider_name}/Rakefile"
        end

        def create_version_file(provider_name, short_name)
          File.open("#{provider_lib_path(provider_name)}/provider/version.rb", "w") do |file|
            file.puts <<EOS 
module TaskMapper
  module #{short_name.capitalize}
    VERSION = '0.0.1'
  end
end
EOS
          end
          puts "Created #{provider_lib_path(provider_name)}/provider/version.rb"
        end

        def create_gemspec(provider_name, short_name)
          File.open("#{provider_name}/#{provider_name}.gemspec", "w") do |file|
            file.puts <<EOS
# Ensure we require the local version and not one we might have installed
# already
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'provider/version'
             
spec = Gem::Specification.new do |s|
   s.name = '#{provider_name}'
   s.version = TaskMapper::#{short_name.capitalize}::VERSION
   s.author = 'Your Name Here'
   s.email = 'your@email.address.com'
   s.homepage = 'http://your.website.com'
   s.platform = Gem::Platform::RUBY
   s.summary = 'A description of your project'
   # Add your other files here if you make them
   s.files = %w(
     lib/provider/version.rb
     lib/#{provider_name}.rb
   )
   s.require_paths << 'lib'
   s.has_rdoc = true
   s.extra_rdoc_files = ['README.rdoc']
   s.rdoc_options << '--title' << '#{provider_name}' << '--main' << 'README.rdoc' << '-ri'
   s.add_development_dependency('rake')
   s.add_development_dependency('rdoc')
   s.add_development_dependency('bundler')
   s.add_runtime_dependency('taskmapper')
end
EOS
          end
          puts "Created #{provider_name}/#{provider_name}.gemspec"
        end

        def create_readme(provider_name)
          File.open("#{provider_name}/README.rdoc", "w") do |file|
            file << "= #{provider_name.capitalize}"
            file << "Describe your project here"
          end
          puts "Created #{provider_name}/README.rdoc"
        end

        def create_lib_file(provider_name, short_name)
          File.open("#{provider_lib_path(provider_name)}/#{provider_name}.rb", "w") do |file|
            file.puts <<EOS
#require YOUR_PROVIDER_API

%w{ #{short_name} project ticket comment }.each do |f|
 require File.dirname(__FILE__) + '/provider/' + f + '.rb'
end
EOS
          end
          puts "Created #{provider_lib_path(provider_name)}/#{provider_name}.rb"
        end

        def create_provider_file(provider_name,short_name)
          File.open("#{provider_lib_path(provider_name)}/provider/#{short_name}.rb", "w") do |file|
            file.puts <<EOS
module TaskMapper::Provider
# This is the Yoursystem Provider for taskmapper
    module #{short_name.capitalize}
       include TaskMapper::Provider::Base
       #TICKET_API = #{short_name.capitalize}::Ticket # The class to access the api's tickets
       #PROJECT_API = #{short_name.capitalize}::Project # The class to access the api's projects

       # This is for cases when you want to instantiate using TaskMapper::Provider::#{short_name.capitalize}.new(auth)
       def self.new(auth = {})
         TaskMapper.new(:#{short_name}, auth)
       end

       # Providers must define an authorize method. This is used to initialize and set authentication
       # parameters to access the API
       def authorize(auth = {})
        # Set authentication parameters for whatever you're using to access the API
        @authentication ||= TaskMapper::Authenticator.new(auth)
       end

       # declare needed overloaded methods here
    end
end
EOS
          end
          puts "Created #{provider_lib_path(provider_name)}/provider/#{short_name}.rb"
        end

        def create_project_file(provider_name, short_name)
          File.open("#{provider_lib_path(provider_name)}/provider/project.rb", "w") do |file|
            file.puts <<EOS
module TaskMapper::Provider
  module #{short_name.capitalize}
    # Project class for #{provider_name}
    
    class Project < TaskMapper::Provider::Base::Project 
      #API = #{short_name.capitalize}::Project # The class to access the api's projects
      # declare needed overloaded methods here
      def copy(project)
          project.tickets.each do |ticket|
             copy_ticket = self.ticket!(:title => ticket.title, :description => ticket.description)
             ticket.comments.each do |comment|
             copy_ticket.comment!(:body => comment.body)
             sleep 1
          end
      end
    end
  end
end
EOS
          end
          puts "Created #{provider_lib_path(provider_name)}/provider/project.rb"
        end

        def create_ticket_file(provider_name, short_name)
          File.open("#{provider_lib_path(provider_name)}/provider/ticket.rb", "w") do |file|
            file.puts <<EOS
module TaskMapper::Provider
  module #{short_name.capitalize}
    # Ticket class for #{provider_name}
    
    class Ticket < TaskMapper::Provider::Base::Ticket
      #API = #{short_name.capitalize}::Ticket # The class to access the api's
      #tickets
      #declare needed overloaded methods here
      
    end
  end
end
EOS
          end
          puts "Created #{provider_lib_path(provider_name)}/provider/ticket.rb"
        end

        def create_comment_file(provider_name, short_name)
          File.open("#{provider_lib_path(provider_name)}/provider/comment.rb", "w") do |file|
            file.puts <<EOS
module TaskMapper::Provider
  module #{short_name.capitalize}
    # The comment class for #{provider_name}
    # Do any mapping between TaskMapper and your system's comment model here
    # versions of the ticket.
    
    class Comment < TaskMapper::Provider::Base::Comment
      #API = #{short_name.capitalize}::Comment # the class to access the api's
      #comment
    end
  end
end 
EOS
          end
          puts "Created #{provider_lib_path(provider_name)}/provider/comment.rb"
        end
      end
    end
  end
end
