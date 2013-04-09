module TM
  module Commands
    class CreateComment < Command

      def execute(task_attribute = '', comment_attribute = '') 
        project = @provider_handler.taskmapper.project(@attributes)
        task_attribute = task_attribute.extend(TM::StringExtensions).to_hash
        ticket = project.tickets(task_attribute).first
        comment_attribute = comment_attribute.extend(TM::StringExtensions).to_hash
        comment = ticket.comment! comment_attribute
        @formatter.before(comment)
        @formatter.format(comment)
        @formatter.after
      end

    end
  end
end
