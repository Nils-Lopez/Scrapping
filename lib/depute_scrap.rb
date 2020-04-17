require 'rubygems'
require 'nokogiri'
require 'open-uri'

def scrap_depute
	page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
	depute_links = page.xpath("//a[contains(text(), 'M.')]") + page.xpath("//a[contains(text(), 'Mme')]") 
	depute_href = depute_links.map { |link| link['href'] }
	ind = 500
	result = {}
	array = []
	depute_href.length.times do 
		page_depute = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr#{depute_href[ind]}"))
		mail_depute = page_depute.xpath('//a[@class="email"]')
		nom_depute = page_depute.xpath('//h1[contains(text(), "M.")]') + page.xpath("//h1[contains(text(), 'Mme')]") 
		result = {nom_depute.text => mail_depute[1].text}
		array[ind] = result
		ind += 1
		result = {}

	end
		puts array
end
scrap_depute
