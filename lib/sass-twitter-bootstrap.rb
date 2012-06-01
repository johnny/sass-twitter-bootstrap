module Bootstrap
  class FrameworkNotFound < StandardError; end

  def self.load!
    if compass?
      register_compass_extension
    else
      raise Bootstrap::FrameworkNotFound, "bootstrap-sass requires either Rails > 3.1 or Compass, neither of which are loaded"
    end
  end

  private
  def self.compass?
    defined?(::Compass)
  end

  def self.register_compass_extension
    base = File.join(File.dirname(__FILE__), '..')
    styles = File.join(base, 'lib')
    ::Compass::Frameworks.register('bootstrap', :stylesheets_directory => styles)
  end
end

Bootstrap.load!
