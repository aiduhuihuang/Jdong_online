import xadmin
from .models import UserProfile,EmailVerifyRecode,Banner
from xadmin.plugins.auth import UserAdmin
from xadmin import views #页面主题功能需要的包
class BaseSetting(object):
    enable_themes=True #页面主题功能
    use_bootswatch=True
xadmin.site.register(views.BaseAdminView,BaseSetting)
#修改左上角和最下面的文字
class GlobalSettings(object):
    site_title="Jdong在线后台管理系统"
    site_footer="激动科技有限公司"
    menu_style="accordion" #设置左边导航伸缩功能
xadmin.site.register(views.CommAdminView,GlobalSettings)


#在xadmin中完成模型注册
class UserProfileAdmin(UserAdmin):
    pass
#注册验证码表
class BannerAdmin(object):
    #表在后台要显示的字段
    list_display=["id","title","image","url","index","add_time"]
    #参与搜索条件的字段
    search_fields=["id","title","url","index"]
    #过滤器
    list_filter=["id","title","image","url","index","add_time"]
    model_icon="fa fa-bandcamp"
xadmin.site.register(Banner,BannerAdmin)


#注册轮播图表
class EmailVerifyRecodeAdmin(object):
    #表在后台要显示的字段
    list_display=["id","code","email","send_type","send_time"]
    #参与搜索条件的字段
    search_fields=["id","code","email","send_type"]
    #过滤器
    list_filter=["id","code","email","send_type","send_time"]
    #后台验证码图标icon
    model_icon = 'fa fa-envelope-open-o'
xadmin.site.register(EmailVerifyRecode,EmailVerifyRecodeAdmin)
