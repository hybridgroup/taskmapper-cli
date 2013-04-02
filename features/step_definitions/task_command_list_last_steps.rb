Given(/^File `\.taskmapper\.rc\.yml` exists$/) do
  step %(File "#{ENV['HOME']}/.taskmapper.rc.yml" exists)
end

Then(/^The stdout should contain 'id: (\d+)'$/) do |id|
  STDOUT.should include(id)
end
