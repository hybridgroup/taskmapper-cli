module TM
  module Commands
    class LastProject < Command
      def execute
        project = @provider_handler.taskmapper.projects.last
        @formmater.before(project)
        @formatter.format(project)
        @formatter.after
      end
    end
  end
end
