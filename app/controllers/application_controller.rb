class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def format_preference
    @format_preference = User.current
  end

  def preferred_format_parser
    @preferred_format_parser ||= PreferredFormatParser.new format_preference
  end

  def preferred_format_formatter
    @preferred_format_formatter ||=
      PreferredFormatFormatter.new format_preference
  end
end
