# frozen_string_literal: true

VCR.configure do |c|
  # the directory where your cassettes will be saved
  c.cassette_library_dir = 'spec/vcr'
  # your HTTP request service.
  c.hook_into :webmock

  c.register_request_matcher(:uri_pattern) { |r1, r2| r2.uri === r1.uri }
end
