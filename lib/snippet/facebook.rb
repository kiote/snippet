# gets facebook-formatted snippets
class Snippet::Facebook
  class << self
    def get_meta(doc)
      img = doc.root.xpath("//meta[@property='og:image']/@content").first
      img = img.value unless img.nil?
      text = doc.root.xpath("//meta[@property='og:description']/@content").first
      text = text.value.to_s unless text.nil?
      title = doc.root.xpath("//meta[@property='og:title']/@content").first
      title = title.value unless title.nil?
      return nil if title.nil?
      { title: title, text: text, img: img }
    end
  end
end