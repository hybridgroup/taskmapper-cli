require 'taskmapper'
require 'taskmapper-kanbanpad'
require 'taskmapper-github'

module TM
  class ProviderHandler
    attr_reader :taskmapper

    def initialize(taskmapper)
      @taskmapper = taskmapper
    end

    def self.build_handler(provider, authentication)
      self.new(TaskMapper.new(provider.to_sym, 
                              authentication.extend(TM::StringExtensions).to_hash))
    rescue NameError
      raise TM::InvalidProvider, "Provider doesn't exists" 
    end
  end
end
