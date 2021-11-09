class NewIn::CLI 
    def call 
        Scraper.scrape_items
        list_items
        menu
    end

    def list_items
        puts "\n New In:"
        @items = Item.all
        @items.each.with_index(1) do |item, x|
            puts "#{x}. '#{item.brand}' - '#{item.name} "
        end
    end
    

    def menu
        input = nil
        while input != "exit"
            puts "\nEnter the number of the item you'd like to view, type list to see all the items again, or type exit to leave this site."
            input = gets.strip.downcase

            if input.to_i > 0 && input.to_i < 91
               the_item = @items[input.to_i-1]
               puts "\n\t'#{the_item.name}' by #{the_item.brand} - #{the_item.price} - #{the_item.url}"
            elsif input == 'list'
               list_items
            elsif input == 'exit'
               goodbye
            else
               puts "\nSorry, please try again!"
            end
        end
    end

    def goodbye
        puts "\nSee you tomorrow for more of the latest pieces!"
    end

    #binding.pry

end 
