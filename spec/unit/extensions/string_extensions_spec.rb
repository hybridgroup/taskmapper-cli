require_relative '../../spec_helper'

describe TM::StringExtensions do 
  let(:values) { "username:username,password:password" }

  context :to_hash do 
    subject { values.extend(TM::StringExtensions).to_hash }
    it { should eql({"username" => "username", "password" => "password"}) }
  end
end
