module PagesHelper
  def twitter_parser (tweet)

    # find url in tweets and ignores periods and commas since twitter users can append them to the url
    regex = %r{
      \b
      (
        (?: [a-z][\w-]+:
         (?: /{1,3} | [a-z0-9%] ) |
          www\d{0,3}[.] |
          [a-z0-9.\-]+[.][a-z]{2,4}/
        )
        (?:
         [^\s()<>]+ | \(([^\s()<>]+|(\([^\s()<>]+\)))*\)
        )+
        (?:
          \(([^\s()<>]+|(\([^\s()<>]+\)))*\) |
          [^\s`!()\[\]{};:'".,<>?«»“”‘’]
        )
      )
    }ix
# find a pattern in the url and decorate it to join the a tag 
      # everytime it finds a pattern of url it adds it to my 
      # target = blank opens in a new tab
      # html safejkk:wq
      #
    tweet.gsub(regex) do |url|
      "<a href='#{url}' target='_blank'>#{url}</a>"
    end.html_safe

  end
end
