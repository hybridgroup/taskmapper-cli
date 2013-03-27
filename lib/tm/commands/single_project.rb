module TM
  module Commands
    class SingleProject
      def initialize(provider_handler, formatter, attributes = '')
        @provider_handler = provider_handler
        @formatter = formatter
        @attributes = attributes.extend(TM::StringExtensions).to_hash
      end

      def execute
        project = @provider_handler.taskmapper.project(@attributes)
        @formatter.before(project)
        @formatter.format(project)
        @formatter.after
      end

    end
  end
end
