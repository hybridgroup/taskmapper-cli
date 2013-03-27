require 'taskmapper'
require 'taskmapper-kanbanpad'

module TM
  class ProviderHandler
    attr_reader :taskmapper

    def initialize(taskmapper)
      @taskmapper = taskmapper
    end

    def self.build_handler(provider, authentication)
      self.new(TaskMapper.new(provider.to_sym, format_authentication(authentication)))
    rescue NameError
      raise TM::InvalidProvider, "Provider doesn't exists" 
    end

    private
    def self.format_authentication(authentication)
      res = authentication.split(/,/).inject({}) do |res, kv|
        arg, val = kv.split(/:/)
        res[arg] = val
        res
      end
      res
    end
  end
end
