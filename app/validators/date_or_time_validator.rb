# Validates an attribute to ensure the value is a Date, Time, or DateTime
# TODO: Can we specify the friendly_x_format in the message?
class DateOrTimeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless [DateTime, Date, Time].any? { |kind| value.is_a? kind }
      record.errors[attribute] << 'invalid date'
    end
  end
end
