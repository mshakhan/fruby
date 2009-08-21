
    require 'rubygems' unless defined?(Gem)
    spec = # -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{fruby}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mikhail Shakhanov"]
  s.date = %q{2009-08-21}
  s.description = %q{Some functional programming features for ruby}
  s.email = %q{mshakhan@gmail.com}
  s.extra_rdoc_files = ["README.rdoc", "LICENSE"]
  s.files = ["LICENSE", "README.rdoc", "Rakefile", "lib/definer.rb", "lib/version.rb", "lib/fruby.rb", "lib/utils.rb", "lib/matcher.rb", "lib/ext.rb", "spec/matcher_spec.rb", "spec/definer_spec.rb", "spec/utils_spec.rb"]
  s.has_rdoc = true
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.4")
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Some functional programming features for ruby}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rake>, [">= 0"])
      s.add_runtime_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end

  