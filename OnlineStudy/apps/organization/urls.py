from django.urls import path,re_path,include
from .views import OrgListView,AddaskView,OrgHomeView,OrgCourseView,OrgDescView,\
    OrgTeacherView,AddFavView,TeacherListView,TeacherDetailView
urlpatterns = [
#课程机构模块
    #首页
    path("list/",OrgListView.as_view(),name="list"),
    #增加咨询
    path("add_ask/",AddaskView.as_view()),
    #机构首页
    re_path("orghome/(?P<org_id>\d+)/",OrgHomeView.as_view()),
    #机构课程
    re_path("orgcourse/(?P<org_id>\d+)/",OrgCourseView.as_view()),
    #课程详细信息
    re_path("orgdesc/(?P<org_id>\d+)/",OrgDescView.as_view()),
    #机构讲师
    re_path("orgteacher/(?P<org_id>\d+)/",OrgTeacherView.as_view()),
    #机构收藏
    path("add_fav/",AddFavView.as_view()),
    #授课讲师
    path("teacherlist/",TeacherListView.as_view()),
    re_path("teacherdetail/(?P<teacher_id>\d+)/",TeacherDetailView.as_view()),

]