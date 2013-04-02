module TM
  module Commands
    class ListAllTasks < Command
      def execute(search_attrs = '')
        project = @provider_handler.taskmapper.project(@attributes)
        tickets = project.tickets
        @formatter.before(tickets.first)
        tickets.each do |ticket|
          @formatter.format(ticket)
        end
        @formatter.after
      end
    end
  end
end
