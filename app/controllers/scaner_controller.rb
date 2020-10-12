class ScanerController < ApplicationController
  def scan
    ShoppingEnter.call(params[:barcode])
    head :ok
  end

  def exit
    ShoppingExit.call
    head :ok
  end
end
