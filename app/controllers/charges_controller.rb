class ChargesController < ApplicationController
	
   def create
    @plan = Plan.find(params[:id])
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @plan.price,
      description: "商品ID:#{@plan.id} 商品名:#{@plan.name}",
      currency: "jpy",
    })
    #rails側の売れたとき処理
    if @plan.update(sold_flg: true)
      redirect_to product_path(params[:id]), notice: "商品を購入しました！"
    end
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
