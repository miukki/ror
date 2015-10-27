module PagesHelper
  def md2html md
    raw(BlueCloth.new(md).to_html)
  end
end
