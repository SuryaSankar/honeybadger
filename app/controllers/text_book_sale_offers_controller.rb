class TextBookSaleOffersController < ApplicationController
  before_action :set_text_book_sale_offer, only: [:show, :edit, :update, :destroy]

  # GET /text_book_sale_offers
  # GET /text_book_sale_offers.json
  def index
    @text_book_sale_offers = TextBookSaleOffer.all
  end

  # GET /text_book_sale_offers/1
  # GET /text_book_sale_offers/1.json
  def show
  end

  # GET /text_book_sale_offers/new
  def new
    @text_book_sale_offer = TextBookSaleOffer.new
  end

  # GET /text_book_sale_offers/1/edit
  def edit
  end

  # POST /text_book_sale_offers
  # POST /text_book_sale_offers.json
  def create
    puts params
    @text_book_sale_offer = TextBookSaleOffer.new(text_book_sale_offer_params)
    @text_book_sale_offer.user_id=current_user.id
    if @text_book_sale_offer.save
      render partial: "current_user_offer"
    else
      render text: "failure"
    end
  end

  # PATCH/PUT /text_book_sale_offers/1
  # PATCH/PUT /text_book_sale_offers/1.json
  def update
    respond_to do |format|
      if @text_book_sale_offer.update(text_book_sale_offer_params)
        format.html { redirect_to @text_book_sale_offer, notice: 'Text book sale offer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @text_book_sale_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /text_book_sale_offers/1
  # DELETE /text_book_sale_offers/1.json
  def destroy
    @text_book_sale_offer.destroy
    respond_to do |format|
      format.html { redirect_to text_book_sale_offers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_text_book_sale_offer
      @text_book_sale_offer = TextBookSaleOffer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def text_book_sale_offer_params
      params.require(:text_book_sale_offer).permit(:price, :contact_detail, :textbook_id)
    end
end
