class OrdersController < ApplicationController

  def index
    @orders = policy_scope(Order).where(user: current_user, state: 'paid').sort { |a, b| b <=> a }
  end

  def show
    @order = current_user.orders.find(params[:id])
    authorize @order
  end

  def create
    @shopping_bag = current_user.shopping_bag
    order  = Order.create!(amount: @shopping_bag.total_amount, user: current_user)
    @shopping_bag.shopping_bag_products.each do |sh_product|
      OrderProduct.create(product: sh_product.product, quantity: sh_product.quantity, order: order)
    end

    authorize order

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: "Order No.#{order.id}",
        amount: (@shopping_bag.total_amount * 100).to_i,
        currency: 'eur',
        quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: new_order_payment_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end
end
