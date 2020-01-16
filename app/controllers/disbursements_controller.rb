class DisbursementsController < ApplicationController
  before_action :set_disbursement, only: [:show, :edit, :update, :destroy]

  # GET /disbursements
  # GET /disbursements.json
  def index
    @disbursements = Disbursement.all
  end

  # GET /disbursements/1
  # GET /disbursements/1.json
  def show
  end

  # GET /disbursements/new
  def new
    @disbursement = Disbursement.new(grant: default_grant)
  end

  # GET /disbursements/1/edit
  def edit
  end

  # POST /disbursements
  # POST /disbursements.json
  def create
    @disbursement = Disbursement.new(disbursement_params.merge({grant: default_grant}))

    respond_to do |format|
      if @disbursement.save
        format.html { redirect_to @disbursement, notice: 'Disbursement was successfully created.' }
        format.json { render :show, status: :created, location: @disbursement }
      else
        format.html { render :new }
        format.json { render json: @disbursement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disbursements/1
  # PATCH/PUT /disbursements/1.json
  def update
    respond_to do |format|
      if @disbursement.update(disbursement_params)
        format.html { redirect_to @disbursement, notice: 'Disbursement was successfully updated.' }
        format.json { render :show, status: :ok, location: @disbursement }
      else
        format.html { render :edit }
        format.json { render json: @disbursement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disbursements/1
  # DELETE /disbursements/1.json
  def destroy
    @disbursement.destroy
    respond_to do |format|
      format.html { redirect_to disbursements_url, notice: 'Disbursement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disbursement
      @disbursement = Disbursement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def disbursement_params
      params.require(:disbursement).permit(:number_children, :name, :landlord, :move_in_amount_cents, :prevention_amount_cents)
    end

    def default_grant
      current_user.partner.grants.first
    end
end
