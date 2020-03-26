from django.contrib import admin
from django.urls import path,re_path

from .views import UserInfoView,UserImagesView,UserCoursInfoView,UserFavoriteView,UserFav_DeleteView,UserMessageView
urlpatterns = [
    #用户基本信息和修改
    path("info/",UserInfoView.as_view()),
    #用户上传头像
    path("images/",UserImagesView.as_view()),
    #用户的课程
    path("courseinfo/",UserCoursInfoView.as_view()),
    #用户收藏
    path("favorite/",UserFavoriteView.as_view()),
    #用户收藏中的删除功能
    path("fav_delete/",UserFav_DeleteView.as_view()),
    #我的消息
    path("message/",UserMessageView.as_view()),

]