class PrintController < ApplicationController
  include PrinterConnection

  def create
    @print = Print.new(print_params)
    @print.printer = Printer.find_by!(name: print_params[:printer])
    @print.file = File.new(@print.file.try(:tempfile).try(:path)) unless @print.file.nil?

    unless krb_valid?(@print.username, @print.password)
      return render json: { errors: ["Bad username or password"] }, status: :forbidden
    end

    if @print.valid?
      print_script @print
      @print.printer.increment!(:weight)
      render json: { success: true }
    else
      render json: { errors: @print.errors }, status: :bad_request
    end
  rescue PrintError => e
    render json: { errors: [e] }, status: :bad_request
  end

  def pq
    render json: print_pq(params[:username], params[:password])
  end

  def list_printers
    @printers = Printer.available.weighted
  end

  private
    def print_params
      params.require(:print).permit(:username, :password, :copies, :printer, :file, :duplex, :collate, :ranges, :media, :ppi, :grayscale)
    end
end
