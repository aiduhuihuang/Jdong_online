import  xadmin
from .models import City,CourseOrg,Teacher


#注册城市表
class CityAdmin(object):
    #表在后台要显示的字段
    list_display=["id","name","description","add_time"]
    #参与搜索条件的字段
    search_fields=["id","name"]
    #过滤器
    list_filter=["id","name","description","add_time"]
    model_icon="fa fa-font-awesome"
xadmin.site.register(City,CityAdmin)


#注册机构信息表
class CourseOrgAdmin(object):
    #表在后台要显示的字段
    list_display=["id","name","category","description","click_nums",
                  "fav_nums","image","address","city","course_nums",
                  "add_time"]
    #参与搜索条件的字段
    search_fields=["id","name","category","description","click_nums",
                  "fav_nums","address","city__name"]
    #过滤器
    list_filter=["id","name","category","description","click_nums",
                  "fav_nums","address","city__name","add_time"]
    #按照点击数排序
    ordering=["-click_nums","-fav_nums"]
    #只读字段
    readonly_fields=["click_nums","fav_nums"]
    # 不显示的字段，它与readonly里的字段冲突，字段设置了readonly那么exclude无效
    exclude = ["students"]
    model_icon="fa fa-institution (alias)"
    #显示样式的字段
    style_fields = {"detail": "ueditor"}
xadmin.site.register(CourseOrg,CourseOrgAdmin)


#注册机构教师表
class TeacherAdmin(object):
    #表在后台要显示的字段
    list_display=["id","courseorg","name","image","work_years",
                  "work_company","work_positon","points","tdetail",
                  "click_nums","fav_nums","add_time"]
    #参与搜索条件的字段
    search_fields=["id","courseorg__name","name","work_years",
                  "work_company","work_positon","points","tdetail",
                  "click_nums","fav_nums"]
    #过滤器
    list_filter=["id","courseorg__name","name","work_years",
                  "work_company","work_positon","points","tdetail",
                  "click_nums","fav_nums","add_time"]
    #教师按照点击数排序
    ordering=["-click_nums","-fav_nums"]
    readonly_fields=["click_nums","fav_nums"]
    model_icon="fa fa-id-card-o"
xadmin.site.register(Teacher,TeacherAdmin)