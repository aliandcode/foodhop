module Enumerable
  def custom_sort
    'ciao'
  end
end

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  include Enumerable

  def bad
    'bad'
  end
end
