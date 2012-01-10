require 'rake/testtask'

Rake::TestTask.new("unit") do |t|
  t.libs.push "lib"
  t.test_files = FileList['spec/unit/*_spec.rb']
  t.verbose = true
end

Rake::TestTask.new("integration") do |t|
  t.libs.push "lib"
  t.test_files = FileList['spec/integration/*_spec.rb']
  t.verbose = true
end

task :default => [:unit, :integration]

