# frozen_string_literal: true

require_relative 'config/application'

Nova.finalize_application!

run Application::Web.builder
