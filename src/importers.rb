# frozen_string_literal: true

require_relative 'lib/injector_namespaced'

module Importers
  Application = InjectorNamespaced.new(Nova::Import, 'application.')
  Infrastructure = InjectorNamespaced.new(Nova::Import, 'infrastructure.')

  module Domain
    Recruitment = InjectorNamespaced.new(Nova::Import, 'domain.recruitment.')
  end
end
