# frozen_string_literal: true

class Customer < ApplicationRecord
  validates :email, presence: true
end
