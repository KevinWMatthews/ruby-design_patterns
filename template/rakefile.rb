require 'rake/testtask'

task default: [:test]

Rake::TestTask.new do |t|
  t.libs << "tests"
  t.test_files = FileList['test/test_*.rb']
end
