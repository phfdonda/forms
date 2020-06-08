class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

    record.errors[attribute] << (options[:message] || 'is not an email')
  end
end

class AlphanumericValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << (options[:message] || 'value must not be nil') if value.nil?
    return if value.split('').none?(/[\W]/)

    record.errors[attribute] << (options[:message] || 'must be composed of only letters and numbers')
  end
end

class User < ApplicationRecord
  validates :username, presence: true, alphanumeric: true
  validates :password, presence: true
  validates :email, presence: true, email: true
end
