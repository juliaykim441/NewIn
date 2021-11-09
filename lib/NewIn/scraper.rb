require 'pry'
class Scraper
    @doc = Nokogiri::HTML(open("https://www.farfetch.com/sets/women/new-in-this-week-eu-women.aspx"))

    def self.scrape_items
        items = @doc.search("div[data-testid='productCard']")
        # binding.pry

        items.each do |item|
            brand = item.css("p[itemprop='brand']").text
            name = item.css("p[itemprop='name']").text
            price = item.css("a[data-component='Price']").text
            url = "https://farfetch.com" + item.css("a[data-component='ProductCardLink']")[0].attributes["href"].value
            Item.new(brand, name, price, url)
            # binding.pry
        end
    end 
end
