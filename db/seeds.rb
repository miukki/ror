# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# admin account
Admin.delete_all
Admin.create email: 'admin@admin.com', password: 'password'

# banners
BannerPosition.delete_all
BannerPosition.create(description: '首页轮播', size: '940x300', id: 1)
BannerPosition.create(description: '首页滑动', size: '140x138', id: 2)

# single pages
Page.delete_all
%W[
  建设中
].each do |page|
  Page.create title: page, content: "new #{page}", uid: page
end

# create menu types
MenuType.delete_all
%W[
  page
  link
  sub_menu
].each do |type|
  MenuType.create(title: type)
end

# main menu
Menu.delete_all
main_menu = {
  '主页' => {
    type: 'link',
    url: '/'
  },
  '趴趴产品' => {
    type: 'sub_menu',
    sub_menu: {
      '原创口语素材' => {type: 'page'},
      '口语模考'    => {type: 'page'},
      '原创作文素材' => {type: 'page'},
      '作文批改'    => {type: 'page'},
      '听力备考网课' => {type: 'page'},
      '阅读备考网课' => {type: 'page'},
      '留学文书'    => {type: 'page'},
    }
  },
  '口语练习平台' => {
    type: 'link',
    url: 'http://training.ieltsassistant.com/'
  },
  '烤鸭论坛' => {
    type: 'link',
    url: 'http://sns.ieltsassistant.com/'
  },
  '常见问题' => {
    type: 'page'
  },
  '关于趴趴' => {
    type: 'page'
  }
}
Menu.add_menu 'main_menu', main_menu

# products menu of footer
products_menu = {
  '原创口语素材' => {type: 'link', url: '/原创口语素材'},
  '口语模考'    => {type: 'link', url: '/口语模考'},
  '原创作文素材' => {type: 'link', url: '/原创作文素材'},
  '作文批改'    => {type: 'link', url: '/作文批改'},
  '听力备考网课' => {type: 'link', url: '/听力备考网课'},
  '阅读备考网课' => {type: 'link', url: '/阅读备考网课'},
  '留学文书'    => {type: 'link', url: '/留学文书'},
}
Menu.add_menu 'products_menu', products_menu

# team menu of footer
team_menu = {
  '关于趴趴' => {
    type: 'page'
  },
  '加入趴趴' => {
    type: 'page'
  },
  '联系合作' => {
    type: 'page'
  }
}
Menu.add_menu 'team_menu', team_menu

# tips menu of footer
tips_menu = {
  '雅思考试' => {
    type: 'page'
  },
  '雅思考试报名' => {
    type: 'link',
    url: '/雅思考试#雅思考试报名'
  },
  '雅思口语评分标准' => {
    type: 'link',
    url: '/雅思考试#雅思口语评分标准'
  },
  '雅思口语考试流程' => {
    type: 'link',
    url: '/雅思考试#雅思口语考试流程'
  },
  '雅思口语考试时间' => {
    type: 'link',
    url: '/雅思考试#雅思口语考试时间'
  }
}
Menu.add_menu 'tips_menu', tips_menu

# support menu of footer
support_menu = {
  '用户帮助中心' => {
    type: 'page'
  },
  '更新日志' => {
    type: 'page'
  },
  '知识产权保护声明' => {
    type: 'page'
  }
}
Menu.add_menu 'support_menu', support_menu

# load html of pages
Dir.glob(File.expand_path(File.dirname(__FILE__)) + "/seeds/pages/*.md") do |file|
  html = File.read(file)
  Page.find_by_uid(
    File.basename(file, '.md')
  ).update(content: html)
end
