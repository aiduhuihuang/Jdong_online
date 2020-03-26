#第三方django库
from django.db import models

#自定模块
#注意：在用外键关联不同子应用的模型是，必须要加上子应用名,否则在迁移过程中报错
from users.models import UserProfile
from courses.models import Course
# Create your models here.


#用户咨询表
class UserAsk(models.Model):
    name=models.CharField(max_length=20,verbose_name="姓名")
    mobile=models.CharField(max_length=11,verbose_name="手机号码")
    course_name=models.CharField(max_length=50,verbose_name="课程名")
    add_time=models.DateTimeField(auto_now=True,verbose_name="咨询时间")
    class Meta:
        db_table="userask"
        verbose_name_plural="用户咨询"


#课程评论表（只针对课程）关联了用户和课程
class CourseComments(models.Model):
    user=models.ForeignKey(to="users.UserProfile",to_field="id",on_delete=models.CASCADE,verbose_name="用户")
    course=models.ForeignKey(to="courses.Course",to_field="id",on_delete=models.CASCADE,verbose_name="课程")
    comments=models.CharField(max_length=400,verbose_name="评论信息")
    add_time = models.DateTimeField(auto_now=True, verbose_name="评论时间")
    class Meta:
        db_table = "coursecomments"
        verbose_name_plural = "用户评论"


FAV_TYPE_STATUS=((1,"课程"),(2,"机构"),(3,"讲师"))
#用户收藏表
class UserFavorite(models.Model):
    user=models.ForeignKey(to="users.UserProfile",to_field="id",on_delete=models.CASCADE,verbose_name="用户")
    #通过下面两个字段,可以找到用户收藏的是哪个类型的具体类容id
    fav_id=models.IntegerField(default=0,verbose_name="数据ID")
    fav_type=models.IntegerField(choices=FAV_TYPE_STATUS,verbose_name="收藏类型",default=1)
    add_time = models.DateTimeField(auto_now=True, verbose_name="收藏时间")
    class Meta:
        db_table = "userfavorite"
        verbose_name_plural = "用户收藏"


#用户消息
class UserMessage(models.Model):
    #消息有具体发送那个用户，0代表系统发送给所有用户的
    user=models.IntegerField(default=0,verbose_name="接收用户")
    title=models.CharField(max_length=30,verbose_name="标题")
    message=models.CharField(max_length=500,verbose_name="消息内容")
    Is_read=models.BooleanField(default=False,verbose_name="是否已读")
    add_time = models.DateTimeField(auto_now=True, verbose_name="收藏时间")
    class Meta:
        db_table = "usermessage"
        verbose_name_plural = "用户消息"

#用户的学习课程
class UserCourse(models.Model):
    user = models.ForeignKey(to="users.UserProfile", to_field="id", on_delete=models.CASCADE, verbose_name="用户")
    course = models.ForeignKey(to="courses.Course", to_field="id", on_delete=models.CASCADE, verbose_name="学习课程")
    add_time = models.DateTimeField(auto_now=True, verbose_name="开始学习时间")
    class Meta:
        db_table = "usercourse"
        verbose_name_plural = "用户学习课程"


