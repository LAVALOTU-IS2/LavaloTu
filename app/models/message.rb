class Message < ApplicationRecord
  include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :name, :email, :comment

  validates :name, presence: true
  validates :email, presence: true
  validates_format_of :email, :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  validates :comment, presence: true
end
