xml.rss "version" => "2.0" do
  xml.channel do
    xml.title { xml.cdata!("title") }
    xml.link url_for(:subdomain => community.to_param)
    xml.description { xml.cdata!("description") }

    @posts.each do |post|
      xml.item do
        xml.title       { xml.cdata!(post.name) }
        xml.link        community_blog_post_url(post.blog, post, :subdomain => post.community.to_param)
        xml.description { xml.cdata!(truncate(post.body, :length => 500)) }
        xml.guid        community_blog_post_url(post.blog, post, :subdomain => post.community.to_param)
        xml.pubDate     post.created_at #.to_s(:rfc822)
      end
    end
  end
end
