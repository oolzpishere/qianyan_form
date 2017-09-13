class Result < ApplicationRecord
  has_many :primary_english_results
  has_many :primary_math_results
end
