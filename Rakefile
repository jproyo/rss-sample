require 'rake/testtask'

task :default => [:test]

 Rake::TestTask.new do |t|
    t.libs << "tests" << "lib"
    t.test_files = FileList['tests/**/*.rb']
    t.verbose = false
  end