require 'rss'

# ITmedia
# ITmedia 総合記事一覧
# http://rss.itmedia.co.jp/rss/2.0/itmedia_all.xml
# 速報
# http://rss.itmedia.co.jp/rss/2.0/news_bursts.xml
# 国内記事
# http://rss.itmedia.co.jp/rss/2.0/news_domestic.xml
# ベンチャー人
# http://rss.itmedia.co.jp/rss/2.0/news_venture.xml
class Rssreader
  def rssrun
    # 前回のデータを削除する
    Topic.delete_all

    urls = ["http://rss.rssad.jp/rss/codezine/new/20/index.xml",
            "http://feeds.gizmodo.jp/rss/gizmodo/index.xml",
            "http://rss.itmedia.co.jp/rss/2.0/itmedia_all.xml",
            "http://wired.jp/rssfeeder/"
            ]

    urls.each do |url|
      rss = nil
      begin
        rss = RSS::Parser.parse(url)
      rescue RSS::InvalidRSSError
        rss = RSS::Parser.parse(url,false)
      end

      rss.items.each do |item|
        # binding.pry
        product = Topic.where(title: item.title, link: item.link, img: item.description).first_or_initialize
        product.save
      end
    end
  end
end

Rssreader.rssrun
