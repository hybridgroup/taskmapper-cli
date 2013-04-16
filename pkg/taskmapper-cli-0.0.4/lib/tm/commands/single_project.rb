module TM
  module Commands
    class SingleProject < Command
      def execute
        project = @provider_handler.taskmapper.project(@attributes)
        @formatter.before(project)
        @formatter.format(project)
        @formatter.after
      end
    end
  end
end
