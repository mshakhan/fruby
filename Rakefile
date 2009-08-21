require 'rubygems'
require 'rake'
require 'rake/clean'
require 'rake/gempackagetask'
require 'rake/rdoctask'
require 'lib/version'

GEM_NAME = 'fruby'

spec = Gem::Specification.new do |s|
  s.name = GEM_NAME
  s.version = FRuby::VERSION
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc', 'LICENSE']
  s.summary = 'Some functional programming features for ruby'
  s.description = s.summary
  s.author = 'Mikhail Shakhanov'
  s.email = 'mshakhan@gmail.com'
  s.files = %w(LICENSE README.rdoc Rakefile) + Dir.glob("{lib,spec}/**/*")
  s.require_path = "lib"

  s.add_dependency 'rake'
  s.add_dependency 'rspec'
    
  s.required_ruby_version = ">= 1.8.4"
end

Rake::GemPackageTask.new(spec) do |p|
  p.gem_spec = spec
  p.need_tar = true
  p.need_zip = true
end

Rake::RDocTask.new do |rdoc|
  files =['README.rdoc', 'LICENSE', 'lib/**/*.rb']
  rdoc.rdoc_files.add(files)
  rdoc.main = "README.rdoc"
  rdoc.title = "FRuby Docs"
  rdoc.rdoc_dir = 'doc/rdoc'
  rdoc.options << '--line-numbers'
end

desc 'Run specs'
task :spec do
  spec_path = ENV['SPEC_PATH'] || 'spec'
  system("spec #{spec_path} -c")
end

desc "Generate *.gemspec file"
task :gemspec do
  path = File.join(File.dirname(__FILE__), "#{GEM_NAME}.gemspec")
  puts %{Writing "#{path}"}
  File.open(path, "w") { |file| file.write(spec.to_ruby) }
end
