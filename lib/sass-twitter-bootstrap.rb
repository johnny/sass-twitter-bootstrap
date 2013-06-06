module Bootstrap
  class FrameworkNotFound < StandardError; end

  def self.load!
    styles = File.dirname(__FILE__)
    if Sass.respond_to? :load_paths
      Sass.load_paths << styles
    elsif defined?(::Compass)
      ::Compass::Frameworks.register('bootstrap', :stylesheets_directory => styles)
    else
      raise Bootstrap::FrameworkNotFound, "sass-twitter-bootstrap requires either Sass master or Compass, neither of which are loaded"
    end
  end
end

Bootstrap.load!
