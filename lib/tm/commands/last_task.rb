module TM
  module Commands
    class LastTask < Command
      def execute
        project = @provider_handler.taskmapper.project(@attributes)
        ticket = project.tickets.last
        @formatter.before(ticket)
        @formatter.format(ticket)
        @formatter.after
      end
    end
  end
end
