module TM
  module StringExtensions
    def to_hash
      self.split(/,/).inject({}) do |hash, kv|
        arg, val = kv.split(/:/)
        hash[arg] = val
        hash 
      end
    end
  end
end
