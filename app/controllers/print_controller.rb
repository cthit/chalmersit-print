class PrintController < ApplicationController
  include PrinterConnection

  def create
    @print = Print.new(print_params)

    # Solution for caching the uploaded file
    # Saved in file_cache and then sent to the client
    if @print.file.present?
      @print.file_name = @print.file.original_filename
      @print.file_cache = @print.file.tempfile.path
    end

    @print.file = File.new(@print.file_cache) if @print.file_cache

    @print.printer = Printer.find_by!(name: print_params[:printer])

    if @print.valid?
      print_script @print
      @print.printer.increment!(:weight)
      render json: { success: true }
    else
      render json: { errors: @print.errors }, status: :bad_request
    end
  end

  def pq
    render json: print_pq(params[:username], params[:password])
  end

  def list_printers
    render json: Printer.available.weighted
  end

  private
    def print_params
      params.require(:print).permit(:username, :password, :copies, :printer, :file, :file_cache, :file_name, :duplex, :collate, :ranges, :media, :ppi, :grayscale)
    end
end
