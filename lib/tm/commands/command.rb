module TM
  module Commands
    class Command 
      def initialize(provider_handler, formatter, attributes = '')
        @provider_handler = provider_handler
        @formatter = formatter
        @attributes = attributes.extend(TM::StringExtensions).to_hash
      end
    end
  end
end
