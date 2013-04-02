module TM
  module Commands
    class FirstProject < Command
      def execute
        project = @provider_handler.taskmapper.projects.first
        @formatter.before(project)
        @formatter.format(project)
        @formatter.after
      end
    end
  end
end
