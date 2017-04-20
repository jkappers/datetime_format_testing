class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def custom_format_source
    @format_source = User.current
  end

  def parser
    @parser ||= FormattedValueParser.new custom_format_source
  end

  def formatter
    @formatter ||= ValueFormatter.new custom_format_source
  end
end
