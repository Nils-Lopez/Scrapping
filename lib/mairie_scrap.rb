require 'rubygems'
require 'nokogiri'
require 'open-uri'

def scrap_mails
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	communes_links = page.xpath("//a[@class='lientxt']")
	commmunes_href = communes_links.map { |link| link['href'] }
	ind = 0
	result = {}
	array = []
	communes_links.length.times do 
		page_commune = Nokogiri::HTML(open("http://annuaire-des-mairies.com#{commmunes_href[ind][1..-1]	}"))
	 	email_address = page_commune.xpath('//td[contains(text(), ".fr")]')
	 	h1_commune = page_commune.xpath('//h1[contains(text(), "- 95")]')
	 	name_commune = h1_commune.text.split(" ")[0].capitalize
	 	result = {name_commune => email_address.text}
	 	array[ind] = result
	 	ind += 1
	 	result = {}
	 end
	 puts array
end
scrap_mails