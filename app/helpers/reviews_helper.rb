# frozen_string_literal: true

module ReviewsHelper
  def generate_avg_rating(ratings)
    if ratings.empty?
      false
    else
      ratings.sum / ratings.length.to_f
    end
  end
end
