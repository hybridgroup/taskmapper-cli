module TM
  module Commands
    class ListAllProjects < Command
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
