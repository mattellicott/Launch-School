class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

# Line 11 is initializing a local variable, `quantity`, rather than assigning a
# value to the instance variable `@quantity`. `quantity` either needs to be
# prefixed with an `@` or an `attr_writer` needs to be set for it at the
# beginning of the class definition.
# Technically, the code won't fail. It just won't have the desired effect.
