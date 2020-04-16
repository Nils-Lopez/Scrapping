require 'rubygems'
require 'nokogiri'
require 'open-uri'


def scrap_crypto
	array = []
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	symbs = page.xpath("//td[@class='cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol']")
	prices = page.xpath("//td[@class='cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price']")
	ind = 0
	crypto = {}
	symbs.length.times do 
		crypto = {symbs[ind].text => prices[ind].text}
		array[ind] = crypto
		ind += 1
		cryto = {}
	end
	print array
end

scrap_crypto