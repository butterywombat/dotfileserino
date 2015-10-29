# Load plugins (only those I whitelist)
Pry.config.should_load_plugins = false
Pry.plugins["doc"].activate!

begin
  require 'hirb'
rescue LoadError
  # Missing goodies, bummer
end

begin
  require 'awesome_print' 
  Pry.config.print = proc { |output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output) }
rescue LoadError => err
  puts "no awesome_print :("
end

begin
  require 'hirb'
rescue LoadError
  # Missing goodies, bummer
end

if defined? Hirb
  # Slightly dirty hack to fully support in-session Hirb.disable/enable toggling
  Hirb::View.instance_eval do
    def enable_output_method
      @output_method = true
      @old_print = Pry.config.print
      Pry.config.print = proc do |output, value|
        Hirb::View.view_or_page_output(value) || @old_print.call(output, value)
      end
    end

    def disable_output_method
      Pry.config.print = @old_print
      @output_method = nil
    end
  end

  Hirb.enable
end

Pry.config.editor = proc { |file, line| "vim +#{line} #{file}" }

rails = File.join Dir.getwd, 'config', 'environment.rb'

if File.exist?(rails) && ENV['SKIP_RAILS'].nil?
  require rails

  if Rails.version[0..0] == "2"
    require 'console_app'
    require 'console_with_helpers'
  elsif Rails.version[0..0] == "3"
    require 'rails/console/app'
    require 'rails/console/helpers'
  else
    warn "[WARN] cannot load Rails console commands (Not on Rails2 or Rails3?)"
  end
end

if defined?(Rails) && Rails.env
  extend Rails::ConsoleMethods

  # Put this in an initializer https://gist.github.com/3759405
  old_prompt = Pry.config.prompt
  Pry.config.prompt = [
    proc {|a,b,c| "\e[31m#{(Rails.env.upcase)}\e[0m #{old_prompt.first.call(a,b,c)}"},
    proc {|a,b,c| "\e[31m#{(Rails.env.upcase)}\e[0m #{old_prompt.second.call(a,b,c)}"},
  ] #unless Rails.env.development?

end

