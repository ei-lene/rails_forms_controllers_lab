class SongsController < ApplicationController
  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    ## Abstract method with f.select
    # @song = Song.new(params[:song]) 
    
    ## This does with the longer html and select code
      # <select name="song[artist]">
      #   <% Artist.all.each do |a| %>
      #     <option name="<%= a.id %>">
      #       <%= a.name %>
      #     </option>
      #   <% end %>
      # </select>

    @song = Song.new(:name => params[:song][:name])
    @song.build_artist(:name => params[:song][:artist])

    @song.save

    if @song.save
      redirect_to @song, notice: 'Song was successfully created.'
    else
      render action: "new"
    end
  end
end