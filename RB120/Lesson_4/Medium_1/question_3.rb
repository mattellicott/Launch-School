class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end

# Changing `attr_reader` to `attr_accessor` would leave `@product_name` open
#   to being modified unintentionally.
# Changing `quantity` to `self.quantity` is not the preferred convention.
# Either way makes it so that `@quantity` can be altered manually without
#   calling `update_quantity`. This could be detrimental to what the coder is
#   trying to achieve.
