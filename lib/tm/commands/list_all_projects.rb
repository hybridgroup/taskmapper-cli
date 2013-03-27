module TM
  module Commands
    class ListAllProjects
      def initialize(provider_handler, formatter, attributes = '') 
        @provider_handler = provider_handler
        @formatter = formatter
      end

      def execute
        projects = @provider_handler.taskmapper.projects
        @formatter.before(projects.first)
        projects.each do |project|
          @formatter.format(project)
        end
        @formatter.after
      end
    end
  end
end
