class Api::V1::ArtistsController < ApplicationController
  # before_action :set_artist, only: [:show, :edit, :update, :destroy]

  # GET /artists
  # GET /artists.json
  def index
    render json: Artist.all
  end

  # GET /artists/1
  # GET /artists/1.json
  def show
    @artist = Artist.find_by_id(params[:id])
    render json: @artist
  end

  # GET /artists/new
  def new
    @artist = Artist.new
  end

  # GET /artists/1/edit
  def edit
  end

  # POST /artists
  # POST /artists.json
  def create
    @artist = Artist.create(artist_params)
    @artist.save
    render json: @artist
  end

  # PATCH/PUT /artists/1
  # PATCH/PUT /artists/1.json
  def update
    artist = Artist.find(params[:id])
    artist.update_attributes(artist_params)
    render json: artist
  end

  # DELETE /artists/1
  # DELETE /artists/1.json
  def destroy
    Artist.destroy(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_params
      params.require(:artist).permit(:name, :bio, :hometown, :user_id, :image)
    end
end
