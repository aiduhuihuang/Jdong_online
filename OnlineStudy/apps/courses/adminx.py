import xadmin
from .models import Course,CourseResource,Lesson,Video,CourseType,BannerCourse


#注册课程类别表
class CourseTypeAdmin(object):
    #表在后台要显示的字段
    list_display=["id","name","desription"]
    #参与搜索条件的字段
    search_fields=["id","name","desription"]
    #过滤器
    list_filter=["id","name"]
xadmin.site.register(CourseType,CourseTypeAdmin)


#注册课程表
class CourseAdmin(object):
    #表在后台要显示的字段
    list_display=["id","name","catory","desription","detail","degree",
                  "learn_times","students","fav_nums","image",
                  "click_total","tag","add_time","go_to"]
    #参与搜索条件的字段
    search_fields=["id","name","desription","detail","degree","learn_times",
                   "students","fav_nums","click_total"]
    #过滤器
    list_filter=["id","name","degree","learn_times","desription","detail",
                   "students","fav_nums","click_total","add_time"]
    #直接在列表里面就可以编辑内容
    list_editable=["name","degree"]
    #排序字段
    ordering=["-click_total","-students"]
    #只读字段
    readonly_fields=["students","fav_nums","click_total"]
    model_icon="fa fa-newspaper-o"
    #多少秒自动刷新一次，是列表可以供用户选择
    refresh_times = [3,5,7]

    # 实现一张用is_banner=False分两张表管理
    def queryset(self):
        qs = super(CourseAdmin, self).queryset()
        result = qs.filter(is_banner=False)
        return result
    #当一个机构的课程数增加了一个，那么该机构中的课程统计总是要增加
    from organization.models import CourseOrg
    #保存课程的时候统计课程机构的课程数
    def save_models(self):
        obj=self.new_obj
        obj.save()#当前课程要先保存,不然可能造成统计少一个
        course_org=obj.courseorg
        if course_org:
            course_org.course_nums=Course.objects.filter(courseorg=course_org).count()
            course_org.save()
xadmin.site.register(Course,CourseAdmin)
#轮播课程,然后第三步用一个方法区分
class BanneCourseAdmin(object):
    # 表在后台要显示的字段
    list_display = ["id", "name", "catory", "desription", "detail", "degree",
                    "is_banner","learn_times", "students", "fav_nums", "image",
                    "click_total", "tag", "add_time"]
    # 参与搜索条件的字段
    search_fields = ["id", "name", "desription", "detail", "degree", "learn_times",
                     "is_banner","students", "fav_nums", "click_total"]
    # 过滤器
    list_filter = ["id", "name", "degree", "learn_times", "desription", "detail",
                   "students", "fav_nums", "click_total", "add_time"]
    # 排序字段
    ordering = ["-click_total", "-students"]
    # 只读字段
    readonly_fields = ["students", "fav_nums", "click_total"]
    model_icon = "fa fa-newspaper-o"
    #实现一张用is_banner=True分两张表管理
    def queryset(self):
        qs=super(BanneCourseAdmin,self).queryset()
        result=qs.filter(is_banner=True)
        return result

xadmin.site.register(BannerCourse, BanneCourseAdmin)

#注册课程章节表
class LessonAdmin(object):
    #表在后台要显示的字段
    list_display=["id","course","name","desription","add_time"]
    #参与搜索条件的字段
    search_fields=["id","course__name","name","desription"]
    #过滤器（对于外键用外键字段__表字段，显示关联的该字段的值）
    list_filter=["id","course__name","name","desription","add_time"]
    model_icon="fa fa-map-o"
xadmin.site.register(Lesson,LessonAdmin)


#注册章节视频表
class VideoAdmin(object):
    #表在后台要显示的字段
    list_display=["id","lesson","name","desription","add_time"]
    #参与搜索条件的字段
    search_fields=["id","lesson__name","name","desription"]
    #过滤器
    list_filter=["id","lesson__name","name","desription","add_time"]
    model_icon="fa fa-file-video-o"
xadmin.site.register(Video,VideoAdmin)


#注册资源表
class CourseResourceAdmin(object):
    #表在后台要显示的字段
    list_display=["id","course","name","download",
                  "download_num","add_time"]
    #参与搜索条件的字段
    search_fields=["id","course__name","name","download",
                  "download_num"]
    #过滤器
    list_filter=["id","course__name","name","download",
                  "download_num"]
    model_icon="fa fa-file"
xadmin.site.register(CourseResource,CourseResourceAdmin)