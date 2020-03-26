from django.urls import path,re_path,include
from .views import CourseListView,CourseDetailView,CoursVideoView,CoursCommentView,AddCommentView,VideoPlayView
urlpatterns = [
#课程机构模块
    #首页
    path("list/",CourseListView.as_view(),name="list"),
    #课程详细
    re_path("detail/(?P<course_id>\d+)/",CourseDetailView.as_view(),name="detail"),
    #课程视频信息
    re_path("video/(?P<course_id>\d+)/",CoursVideoView.as_view(),name="video"),
    #课程的评论
    re_path("comment/(?P<course_id>\d+)/",CoursCommentView.as_view(),name="comment"),
    path("add_comment/",AddCommentView.as_view(),name="addcomment"),
    path("play/",VideoPlayView.as_view()),

]