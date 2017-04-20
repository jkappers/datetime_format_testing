class DateOrTimeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless [DateTime, Date, Time].any? { |kind| value.is_a? kind }
      record.errors[attribute] << 'invalid date'
    end
  end
end
