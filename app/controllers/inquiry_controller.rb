class InquiryController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def edit
    @inquiry = Inquiry.new(inquiry_params)
  end

  def confirm
    @inquiry = Inquiry.new(inquiry_params)
    render :new unless @inquiry.valid?
  end

  def thanks
    @inquiry = Inquiry.new(inquiry_params)
    InquiryMailer.send_mail(@inquiry).deliver
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :name_kana, :email, :message)
  end
end
