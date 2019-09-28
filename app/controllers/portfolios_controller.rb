class PortfoliosController < ApplicationController
	  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
	  layout "portfolio"

	def index 
		@portfolio_items = Portfolio.all
	end

	def anguler
		@anugler_portfolio_items = Portfolio.anguler
	end

	def show

	end

	def new
		@portfolio_item = Portfolio.new
		3.times { @portfolio_item.technologies.build }
	end

	def create
		 @portfolio_item = Portfolio.new(portfolio_params)

	    respond_to do |format|
	      if @portfolio_item.save
	        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
	        format.json { render :show, status: :created, location: @portfolio_item }
	      else
	        format.html { render :new }
	        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def edit 
	end

	 def update

	    respond_to do |format|
	      if @portfolio_item.update(params.require(:portfolio).permit(:title, :body, :subtitle))
	        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
	        format.json { render :show, status: :ok, location: @portfolio_item }
	      else
	        format.html { render :edit }
	        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
	      end
	    end
  	end


	def destroy
	    # @portfolio_item  = Portfolio.find([:id])

	    @portfolio_item.destroy
	    respond_to do |format|
	      format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully destroyed.' }
	      format.json { head :no_content }
	    end
	end

	 private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio
      @portfolio_item = Portfolio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_params
      params.require(:portfolio).permit(:title, :body, :subtitle,technologies_attributes: [:name])
    end

end
