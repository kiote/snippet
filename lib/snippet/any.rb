# gets not-facebook formatted snippet
class Snippet::Any
  class << self
      def get_meta(doc)
        title = doc.root.xpath("//meta[@name='title']/@content").first || \
          doc.root.xpath("//title").to_s
        title = title.value unless title.respond_to? :capitalize
        title.gsub!(/<[^>]+>/m,'').strip!
        text = doc.root.xpath("//p/text()").first || doc.root.xpath("//meta[@name='description']/@content").first
        img = doc.root.xpath("//link[@rel='image_src']/@href").first
        img = img.value unless img.nil?
        { title: title, text: text.to_s, img: img }
      end
    end
end