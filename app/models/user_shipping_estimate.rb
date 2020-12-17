class UserShippingEstimate
  include ActiveModel::Model

  attr_accessor :widget_name,
    :widget_user_facing_id,
    :shipping_zone,
    :destination_postal_code

  def persisted?
    true
  end

  def to_key
    [ widget_user_facing_id, destination_postal_code ]
  end
end
