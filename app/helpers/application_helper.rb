# frozen_string_literal: true

module ApplicationHelper
  def generate_name(name_array)
    if name_array.size != 1
      name_string = 'Wrong way'
      return name_string
    end
    name_array[0].to_s
  end
end
