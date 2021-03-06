# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "tailor-hook"
  gem.homepage = "http://github.com/sergio-fry/tailor-hook"
  gem.license = "MIT"
  gem.summary = %Q{add tailor style-check to your hooks}
  gem.description = %Q{pre-commit hook, that checks ruby-style}
  gem.email = "sergei.udalov@gmail.com"
  gem.authors = ["Sergei O. Udalov"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'


task :default => :spec
Rake::TestTask.new(:spec) do |t|
  t.libs << 'spec'
  t.pattern = 'spec/**/*_spec.rb'
  t.verbose = false
end

require 'rcov/rcovtask'
Rcov::RcovTask.new do |test|
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
  test.rcov_opts << '--exclude "gems/*"'
end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "tailor-hook #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
  rdoc.rdoc_files.include('bin/tailor-hook-install')
  rdoc.rdoc_files.include('pre-commit')
end

