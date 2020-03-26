"""OnlineStudy URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,re_path,include
from django.views.generic import TemplateView
from .settings import MEDIA_ROOT
from django.views import static
import xadmin

from users.views import index,LoginView,RegisterView,\
    EmailActive,ForgetPwdView,ResetView,logout,IndexView

urlpatterns = [
    # path('admin/', admin.site.urls),
    path('xadmin/', xadmin.site.urls),
    #测试主模板
    path("base/",TemplateView.as_view(template_name="base.html")),
    # path("login/",login,name="login"),
    #基于类
    path("login/",LoginView.as_view(),name="login"),
    path("register/",RegisterView.as_view(),name="register"),
    #邮箱验证
    re_path("active/(?P<active>.*)/$",EmailActive.as_view()),
    #找回密码的邮件发送
    re_path("forgetpwd/", ForgetPwdView.as_view(),name="forgetpwd"),
    re_path("reset/(?P<reset>.*)/$", ResetView.as_view()),


    #机构模块
    #首页
    path("org/",include("organization.urls")),
    #课程模块
    #首页
    path("course/",include("courses.urls")),
    #用户模块
    #个人中心
    path("users/",include("users.urls")),

    #主页,在根路径下就可以显示这个页面
    path("index/",IndexView.as_view(),name="index"),
    re_path("^$", IndexView.as_view(), name="index"),
    #退出
    path("logout/",logout,name="logout"),
    #验证码图片
    re_path("^captcha/",include("captcha.urls")),
    #富文本url
    path('ueditor/',include('DjangoUeditor.urls' )),
    #当debug=false时,STATICFILES_DIRS将失效,必须从新配置
    # re_path('^static/(?P<path>.*)$', static.serve, {'document_root': MEDIA_ROOT}, name='static')
    re_path(r'^static/(?P<path>.*)$', static.serve, {"document_root": MEDIA_ROOT}),
]
#整个项目全局404配置
handler404="users.views.page_not_found"
handler500="users.views.server_error"
