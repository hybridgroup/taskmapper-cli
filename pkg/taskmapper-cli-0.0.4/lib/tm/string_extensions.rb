module TM
  module StringExtensions
    def to_hash
      return '' if self.nil?
      self.split(/,/).inject({}) do |hash, kv|
        arg, val = kv.split(/:/)
        hash[arg.to_sym] = val
        hash 
      end
    end
  end
end
