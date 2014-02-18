module ApplicationHelper

  def average_rating(restaurant)
    total = 0
    count = num_reviews(restaurant)

    if count == 0
      return 0
    else
      restaurant.reviews.each do |review|
        total += review.rating
      end

      return (total.to_f / count).round(1)
    end
  end

  def num_reviews(restaurant)
    return restaurant.reviews.count
  end

end
