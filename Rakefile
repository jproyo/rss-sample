require 'rake/testtask'

task :default => [:test]

 Rake::TestTask.new do |t|
    t.libs << "lib"
    t.libs << "tests"
    t.test_files = FileList['tests/**/*.rb']
    t.verbose = false
  end