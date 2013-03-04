require 'rails/generators/named_base'

module FactoryGirl
  module Generators
    class Base < Rails::Generators::NamedBase #:nodoc:
      def self.source_root
        @_factory_girl_source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'factory_girl', generator_name, 'templates'))
      end

      def explicit_class_option
        unless class_name == singular_table_name.camelize
          if RUBY_VERSION >= '1.8'
            ", class: '#{class_name}'"
          else
            ", :class => '#{class_name}'"
          end
        end
      end
    end
  end
end
