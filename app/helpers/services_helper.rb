# frozen_string_literal: true

module ServicesHelper
  def generate_seller_rating(identifier)
    rating_sum = 0
    rating_i = 0
    user = AdminUser.find(identifier[0])
    user_services = user.services
    user_services.each do |service|
      next if service.review.nil?

      rating_sum += service.review.rating
      rating_i += 1
    end
    if rating_i.zero?
      false
    else
      rating_sum / rating_i.to_f
    end
  end
end
