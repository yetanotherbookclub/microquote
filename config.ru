require 'json'
require 'rack/parser'
require_relative 'app'

use Rack::Parser, :content_types => {
  'application/json' => Proc.new { |body| JSON.parse(body) }
}

run App
