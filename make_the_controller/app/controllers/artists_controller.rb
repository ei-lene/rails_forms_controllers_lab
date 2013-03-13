class ArtistsController < ApplicationController
  def show
    @artist = Artist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @artist }
    end
  end

  def new
    @artist = Artist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @artist }
    end
  end

  def create
    # TODO: fill me in!
    @artist = Artist.new(params[:artist])
    @artist.save
    params[:song][:name].each do |song_name|
      # find_or_created_name doesn't work unless artist is saved
      @song = Song.find_or_create_by_name(song_name)
      @song.artist_id = @artist.id
      @song.save
      # songs.build stores the information and artist can be saved later
      # @artist.songs.build(:name => song_name)
    end

    if @artist.save
      redirect_to @artist, notice: 'Artist was successfully created.'
    else
      format.html { render action: "new" }
    end
  end
end
