skip_before_action :authorize, only: :create

def create

  product = Product.find(params[:product_id])


  @line_item = @cart.add_product(product.id)

  respond_to do |format|

    if @line_item.save
      format.html { redirect_to store_url }
      format.js
      format.js { @current_item = @line_item }

      format.json { render action: 'show',
                           status: :created, location: @line_item }
    else
      format.html { render action: 'new' }
      format.json { render json: @line_item.errors,
                           status: :unprocessable_entity }
    end
  end
end

def destroy

  @cart.destroy if @cart.id == session[:cart_id]
  session[:cart_id] = nil
  respond_to do |format|
    format.html { redirect_to store_url,
    notice: 'Теперь ваша корзина пуста!' }
    format.json { head :no_content }
  end
end


