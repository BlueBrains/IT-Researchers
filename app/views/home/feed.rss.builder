#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "IT-researchers Community"
    xml.author "Team development"
    xml.description "Software-Development, Researches, Computer-Science"
    xml.link "localhost:3000"
    xml.language "en"

    for paper in @papers
      xml.item do
        if paper.title
          xml.title paper.title
        else
          xml.title ""
        end
        xml.author paper.researchers.first.username
        xml.pubDate paper.created_at.to_s(:rfc822)
        xml.link "localhost:3000/papers/show/" + paper.id.to_s
        xml.guid paper.id

        abstract = paper.abstract
    # if you like, do something with your content text here e.g. insert image tags.
    # Optional. I'm doing this on my website.
      #  if paper.post_attachments.exists?
            image_url = ""
            image_url = paper.category.picture.thumb.url if !paper.category.nil?
            image_caption = ""
            image_align = ""
            image_tag = "
                <p><img src='" + image_url +  "' alt='" + image_caption + "' title='" + image_caption + "' align='" + image_align  + "' /></p>
              "
            abstract = abstract.sub('{image}', image_tag)
        #end
        xml.description "<p>" + abstract + "</p>"

      end
    end
  end
end