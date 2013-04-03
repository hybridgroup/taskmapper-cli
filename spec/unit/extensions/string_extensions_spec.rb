require_relative '../../spec_helper'

describe TM::StringExtensions do 

  describe 'when an string is send' do 
    let(:values) { "username:username,password:password" }
    context :to_hash do 
      subject { values.extend(TM::StringExtensions).to_hash }
      it { should eql({:username => "username", :password => "password"}) }
    end
  end

  describe 'when nil is send' do 
    context :to_hash do 
      subject { nil.extend(TM::StringExtensions).to_hash }
      it { should eql '' }
    end
  end
end
