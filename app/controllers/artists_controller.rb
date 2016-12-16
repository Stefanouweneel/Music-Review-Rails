class ArtistsController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  require 'rubygems'
  require 'net/http'

  def index
  end

  def show
    @artist = Artist.find(params[:id])
    @posts = Post.all

    name = @artist.name.downcase.capitalize

    wikiurl = "https://en.wikipedia.org/wiki/#{name.to_s.tr(' ', '_')}"
    wikiresponse = Net::HTTP.get_response(URI(wikiurl))

    puts wikiresponse.to_s

    case wikiresponse
    when Net::HTTPSuccess
      wikidata = Nokogiri::HTML(open(wikiurl))
      @wikiscrape = wikidata.css('#mw-content-text')
      puts @wikiscrape
    when Net::HTTPRedirection
      @wikiscrape = ""
      puts ""
    end
  end

  def new
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to artist_path(@artist)
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy

    redirect_to root_path
  end

  def artist_params
    params.require(:artists).permit(:name)
  end

end
