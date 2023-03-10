class AppointmentsController < ApplicationController
  include NetworkHelper
  before_action :set_appointment, only: %i[ show edit update destroy ]

  # GET /appointments or /appointments.json
  def index
    @appointments = Appointment.all
  end

  # GET /appointments/1 or /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments or /appointments.json
  def create
    endpoint = "/appointments/"
    # body = { title: "Sample API", type: "online", duration: 60, datetime: '2026-01-15T0:00:00Z', participants: [{ email: "patient@email.com", name: "Test Patient", fee: 10}, { email: "patient2@email.com", name: "Test Patient", fee: 10}]}
    body = appointment_params
    response = do_request(type: "POST", endpoint: endpoint, **body)
    puts response
    # @appointment = Appointment.new(appointment_params)
    # # strftime('%Y-%m-%dT%H:%M:%S%z')
    # respond_to do |format|
    #   if @appointment.save
    #     format.html { redirect_to appointment_url(@appointment), notice: "Appointment was successfully created." }
    #     format.json { render :show, status: :created, location: @appointment }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @appointment.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /appointments/1 or /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to appointment_url(@appointment), notice: "Appointment was successfully updated." }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1 or /appointments/1.json
  def destroy
    @appointment.destroy

    respond_to do |format|
      format.html { redirect_to appointments_url, notice: "Appointment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # def appointment_params
    #   params.require(:appointment).permit(:title, :type, :duration, :datetime, participants: [:email, :name, :fee])
    # end

    def appointment_params
      params.require(:appointment).permit(:title, :type, :duration, :datetime, participants_attributes: [:email, :name, :fee])
    end
end
