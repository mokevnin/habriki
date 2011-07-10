xml.instruct! :xml, :version => "1.0"

xml.rss "version" => "2.0" do
  xml.channel do
    xml.title { xml.cdata!("Posts") }
    xml.link community_root_url(community)
    xml.description { xml.cdata!("Posts") }
    #xml.image do |image|
      #image.url 
      #image.title { xml.cdata!("Posts") }
      #image.link "Posts"
    #end

    @posts.each do |post|
      xml.item do
        xml.title       { xml.cdata!(post.name) }
        xml.link        community_blog_post_url(community, post.blog, post)
        xml.description { xml.cdata!(truncate(post.body, :length => 500)) }
        #xml.guid       
        xml.pubDate     post.created_at #.to_s(:rfc822)
      end
    end
  end
end

