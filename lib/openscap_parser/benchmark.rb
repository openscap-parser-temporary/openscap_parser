# frozen_string_literal: true

require 'openscap_parser/util'
require 'openscap_parser/xml_file'
require 'openscap_parser/rules'
require 'openscap_parser/profiles'
require 'openscap_parser/rule_references'
require 'openscap_parser/groups'
require 'openscap_parser/values'

# Mimics openscap-ruby Benchmark interface
module OpenscapParser
  # A class for parsing Benchmark information
  class Benchmark < XmlNode
    include OpenscapParser::Util
    include OpenscapParser::Rules
    include OpenscapParser::RuleReferences
    include OpenscapParser::Profiles
    include OpenscapParser::Groups
    include OpenscapParser::Values

    def id
      @id ||= @parsed_xml['id']
    end

    def title
      @title ||= @parsed_xml.xpath('title')&.text
    end

    def description
      @description ||= newline_to_whitespace(
        @parsed_xml.xpath('description') &&
          @parsed_xml.xpath('description').text || ''
      )
    end

    def version
      @version ||= @parsed_xml.xpath('version')&.text
    end
  end
end
