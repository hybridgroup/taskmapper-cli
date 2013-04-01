require_relative '../../spec_helper'

class DummyFormat 
  include TM::Format
end

describe TM::Format do 
  let(:project) do 
    {'id' => 1, 'name' => 'test-project', 'description' => 'my test project', 'dummy' => 'info' }
  end
  let(:ticket) do 
    {'id' => 1, 'title' => 'Found a bug', 'state' => 'open', 'body' => 'Having problems', 'status' => 'open'}
  end

  describe "when entity is a project" do 
    context :normalize_entity do 
      subject { DummyFormat.new.normalize_entity(project) }
      it { should == {'id' => 1, 'name' => 'test-project', 'description' => 'my test project'} } 
    end
  end

  describe "when entity is a ticket" do 
    context :normalize_entity do 
      subject { DummyFormat.new.normalize_entity(ticket) }
      it { should == {'id' => 1, 'title' => 'Found a bug', 'status' => 'open'} }
    end
  end

end
