# frozen_string_literal: true

require_relative 'lib/simpleidn/email/version'

Gem::Specification.new do |spec|
  spec.name = 'simpleidn-email'
  spec.version = SimpleIDN::Email::VERSION
  spec.authors = ['Timo Schilling']
  spec.email = ['timo@schilling.io']

  spec.summary = 'Punycode ACE email addresses to unicode UTF-8 (and vice-versa) email addresses conversion.'
  spec.description = <<~TEXT
    This gem allows easy conversion from punycode ACE email addresses to unicode UTF-8 email addresses and vice-versa.
  TEXT
  spec.homepage = 'https://github.com/timoschilling/simpleidn-email'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.7.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'simpleidn'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
