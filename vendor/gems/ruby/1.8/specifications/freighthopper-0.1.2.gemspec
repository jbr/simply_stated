# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{freighthopper}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jacob Rothstein"]
  s.date = %q{2010-02-03}
  s.default_executable = %q{convert_to_should_syntax}
  s.description = %q{More core ext}
  s.email = %q{github@jacobrothstein.com}
  s.executables = ["convert_to_should_syntax"]
  s.extra_rdoc_files = ["LICENSE", "README"]
  s.files = [".gitignore", "Gemfile", "LICENSE", "README", "Rakefile", "VERSION", "bin/convert_to_should_syntax", "freighthopper.gemspec", "init.rb", "lib/freighthopper.rb", "pkg/.gitkeep", "test/array_test.rb", "test/define_and_alias_test.rb", "test/float_test.rb", "test/hash_test.rb", "test/kernel_test.rb", "test/lazy_alias_test.rb", "test/object_test.rb", "test/string_test.rb", "test/test_helper.rb", "vendor/gems/cache/shoulda-2.10.2.gem", "vendor/gems/cache/test-rig-0.0.1.gem", "vendor/gems/doc/.gitkeep", "vendor/gems/gems/.gitkeep", "vendor/gems/specifications/.gitkeep"]
  s.homepage = %q{http://github.com/jbr/freighthopper}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Some extensions for riding the rails}
  s.test_files = ["test/array_test.rb", "test/define_and_alias_test.rb", "test/float_test.rb", "test/hash_test.rb", "test/kernel_test.rb", "test/lazy_alias_test.rb", "test/object_test.rb", "test/string_test.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
