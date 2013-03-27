require_relative '../spec_helper'

class Dummy
end

describe TM do 
  let(:tm) { Dummy.new.extend(TM) }
  let(:provider) { "test" }
  let(:authentication) { "token:hello,username:username" }
  let(:taskmapper) { stub } 
  let(:tm_project) do 
    stub(id: 1, name: 'test-project', 
         created_at: Time.now, updated_at: Time.now) 
  end

  pending "without errors" do 
    before(:each) do 
      taskmapper.should_receive(:projects).and_return([tm_project])
      TaskMapper.should_receive(:new).and_return(taskmapper)
    end
    context :list_projects do 
      subject { tm.list_projects(provider, authentication) } 
      its(:count) { should == 1 }
    end
  end

  pending "with arguments errors" do  
    describe "when provider name is wrong" do 
      context :list_projects do 
        subject { lambda { tm.list_projects(provider, authentication) } }
        it { should raise_error }
      end
    end

  end

end
