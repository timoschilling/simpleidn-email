# frozen_string_literal: true

require_relative 'email/version'
require 'simpleidn'

module SimpleIDN
  # This module provides methods to convert email addresses from punycode ACE to unicode UTF-8 and vice-versa.
  module Email
    module_function

    def to_unicode(email)
      email.gsub(/@(.*)/) do
        "@#{SimpleIDN.to_unicode(::Regexp.last_match(1))}"
      end
    end

    def to_ascii(email)
      email.gsub(/@(.*)/) do
        "@#{SimpleIDN.to_ascii(::Regexp.last_match(1))}"
      end
    end
  end
end
