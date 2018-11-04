class Api::V1::ArtistsController < ApplicationController
  # before_action :set_artist, only: [:show, :edit, :update, :destroy]

  # GET /artists
  # GET /artists.json
  def index
    @artists = Artist.all
    render :json =>@artists.as_json(methods: :image_url)
  end

  # GET /artists/1
  # GET /artists/1.json
  def show
    @artist = Artist.find_by_id(params[:id])
    render json: @artist.as_json(methods: :image_url)

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
    @artist = Artist.new()
    @artist.name = artist_params[:name]
    @artist.bio = artist_params[:bio]
    @artist.hometown = artist_params[:hometown]
    # Process the file, decode the base64 encoded file
    if(params[:artist][:image] != null)
      @binary = params[:artist][:image].split(',')
      @image_code = @binary[1]
       @decoded_file = Base64.decode64(@image_code)

       @filename = "document_data.JPG"            # this will be used to create a tmpfile and also, while setting the filename to attachment
       @tmp_file = Tempfile.new(@filename)        # This creates an in-memory file [details here][1]
       @tmp_file.binmode                          # This helps writing the file in binary mode.
       @tmp_file.write @decoded_file
       @tmp_file.rewind()

       # We create a new model instance
      @artist.image.attach(io: @tmp_file, filename: @filename) # attach the created in-memory file, using the filename defined above
      @artist.save
      @tmp_file.unlink # deletes the temp file
    else
      @artist.save
    end

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
