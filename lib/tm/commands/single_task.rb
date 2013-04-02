module TM
  module Commands
    class SingleTask < Command
      def execute
        project = @provider_handler.taskmapper.project(@attributes)
        ticket = project.ticket(@single_attrs)
        @formatter.before(ticket)
        @formatter.format(ticket)
        @formatter.after
      end
    end
  end
end
