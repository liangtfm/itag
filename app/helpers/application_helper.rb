module ApplicationHelper

  def average_rating(restaurant)
    total = 0

    restaurant.reviews.each do |review|
      total += review.rating
    end

    return total
  end

end
