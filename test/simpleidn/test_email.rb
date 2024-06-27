# frozen_string_literal: true

require 'test_helper'

module SimpleIDN
  class TestEmail < Minitest::Test
    def test_that_it_has_a_version_number
      refute_nil ::SimpleIDN::Email::VERSION
    end

    def test_it_converts_ascii_to_unicode
      assert_equal 'max@müller.de', SimpleIDN::Email.to_unicode('max@xn--mller-kva.de')
    end

    def test_it_converts_unicode_to_ascii
      assert_equal 'max@xn--mller-kva.de', SimpleIDN::Email.to_ascii('max@müller.de')
    end

    def test_it_does_nothing_when_ascii_to_ascii
      assert_equal 'max@mueller.de', SimpleIDN::Email.to_ascii('max@mueller.de')
    end

    def test_it_does_nothing_when_unicode_to_unicode
      assert_equal 'max@müller.de', SimpleIDN::Email.to_unicode('max@müller.de')
    end

    def test_it_does_nothing_with_invalid_ascii_email
      assert_equal 'max-at-mueller.de', SimpleIDN::Email.to_unicode('max-at-mueller.de')
    end

    def test_it_does_nothing_with_invalid_unicode_email
      assert_equal 'max-at-müller.de', SimpleIDN::Email.to_ascii('max-at-müller.de')
    end
  end
end
