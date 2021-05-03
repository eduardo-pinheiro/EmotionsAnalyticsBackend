class Occurrence < ApplicationRecord
  belongs_to :test
  belongs_to :expression
  belongs_to :emotion
  belongs_to :people_appearance
end
