module TM
  module Commands
    class FirstTask < Command
      def execute(search_attrs = '')
        project = @provider_handler.taskmapper.project(@attributes)
        ticket = project.tickets.first
        @formatter.before(ticket)
        @formatter.format(ticket)
        @formatter.after
      end
    end
  end
end
