import xadmin
from .models import UserAsk,UserCourse,CourseComments,UserMessage,UserFavorite


#注册用户咨询表
class UserAskAdmin(object):
    #表在后台要显示的字段
    list_display=["id","name","mobile","course_name","add_time"]
    #参与搜索条件的字段
    search_fields=["name","mobile","course_name"]
    #过滤器
    list_filter=["name","mobile","course_name","add_time"]
    model_icon="fa fa-question-circle-o"
xadmin.site.register(UserAsk,UserAskAdmin)


#注册课程评论表
class CourseCommentsAdmin(object):
    #表在后台要显示的字段
    list_display=["id","user","course","comments","add_time"]
    #参与搜索条件的字段
    search_fields=["id","user_username","course_name","comments"]
    #过滤器
    list_filter=["id","user_username","course_name","comments","add_time"]
    model_icon="fa fa-user-secret"
xadmin.site.register(CourseComments,CourseCommentsAdmin)


#注册用户收藏表
class UserFavoriteAdmin(object):
    #表在后台要显示的字段
    list_display=["id","user","fav_id","fav_type","add_time"]
    #参与搜索条件的字段
    search_fields=["id","user__username","fav_id","fav_type"]
    #过滤器
    list_filter=["id","user","fav_id","fav_type","add_time","add_time"]
    model_icon="fa fa-thumbs-up"
xadmin.site.register(UserFavorite,UserFavoriteAdmin)


#注册用户消息表
class UserMessageAdmin(object):
    #表在后台要显示的字段
    list_display=["id","user","title","message","Is_read","add_time"]
    #参与搜索条件的字段
    search_fields=["id","user__username","title","message","Is_read"]
    #过滤器
    list_filter=["id","user__username","title","message","Is_read","add_time"]
    model_icon="fa fa-volume-down"
xadmin.site.register(UserMessage,UserMessageAdmin)


#注册用户学习课程表
class UserCourseAdmin(object):
    #表在后台要显示的字段
    list_display=["id","user","course","add_time"]
    #参与搜索条件的字段
    search_fields=["id","user__username","course__name"]
    #过滤器
    list_filter=["id","user__username","course__name","add_time"]
    model_icon="fa fa-mortar-board (alias)"
xadmin.site.register(UserCourse,UserCourseAdmin)