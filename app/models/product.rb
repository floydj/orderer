class Product < ApplicationRecord
  extend Mobility
  translates :title, type: :string

  has_many :models
  has_many :options
  has_many :models_by_display, -> { order(:display) }, class_name: "Model"
end
