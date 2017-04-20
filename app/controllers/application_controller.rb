class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def datetime_format_source
    @datetime_format_source = User.current
  end

  def datetime_parser
    @datetime_parser ||= DateAndTimeParser.new datetime_format_source
  end

  def datetime_formatter
    @datetime_formatter ||= DateAndTimeFormatter.new datetime_format_source
  end
end
