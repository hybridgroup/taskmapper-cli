module TM
  module Commands
    class ListAllCommentsForTask < Command
      def execute(search_attrs = '')
        project = @provider_handler.taskmapper.project(@attributes)
        ticket = project.tickets(search_attrs.extend(TM::StringExtensions).to_hash).first
        comments = ticket.comments
        @formatter.before(comments.first)
        comments.each do |comment|
          @formatter.format(comment)
        end
        @formatter.after
      end
    end
  end
end
