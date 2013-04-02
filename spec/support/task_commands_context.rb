shared_context 'task_commands_context' do 

  let(:ticket) { stub(:comments => [stub]) }
  let(:tickets) { [ticket] }
  let(:project) { stub(:tickets => tickets) }
  let(:taskmapper) { stub(:project => project) }
  let(:provider_handler) { stub(:taskmapper => taskmapper) }
  let(:formatter) { stub(:before => true, :format => true, :after => true) }

end
