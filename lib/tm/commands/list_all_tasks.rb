module TM
  module Commands
    class ListAllTasks
      def initialize(provider_handler, formatter, attributes = '')
        @provider_handler = provider_handler
        @formatter = formatter
        @attributes = attributes.extend(TM::StringExtensions).to_hash
      end

      def execute
        project = @provider_handler.taskmapper.project(@attributes)
        tickets = project.tickets
        @formatter.before(tickets.first)
        tickets.each do |ticket|
          @formatter.format(ticket)
        end
        @format.after 
      end
    end
  end
end
