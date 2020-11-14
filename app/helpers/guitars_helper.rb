module GuitarsHelper

    def display_index_header
       if @auction
        content_tag(:h2,"Guitars For Sale at the  #{@auction.name} auction")
       else
        content_tag(:h1, "All Guitars")
       end
    end

  
    def auction_form_option(form_builder)
      if @auction
         content_tag(:p, "Auction: #{@auction.title}")
      else
         render partial: "auctionform", locals: {f: form_builder}
      end
    end
  
  end