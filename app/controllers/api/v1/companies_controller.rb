class Api::V1::CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
    render :json =>@companies
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @company = Company.find_by_id(params[:id])
    render json: @company
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    if @company.save
      render json: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    if @company.update(company_params)
      render :show, status: :ok, location: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.fetch(:company, {})
    end
end
