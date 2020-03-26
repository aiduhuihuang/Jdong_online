#PEPE规则
#第一块区域 python自带包
# from datetime import datetime
#第二块区域 第三方带的包(django属于第三方)
from django.db import models
#django中后台用到的auth_user表中字段的模型类，
# 可以继承他，用他的在结合我们自己的字段一起使用
from django.contrib.auth.models import AbstractUser

#第三块区域 我们自己定义模块
# Create your models here.


#用户轮廓简况
GENDER_STATUS=((0,"女"),(1,"男"))
class UserProfile(AbstractUser):
    nick_name=models.CharField(max_length=30,default="",verbose_name="用户昵称")
    birthday=models.DateField(verbose_name="出生日期",null=True,blank=True)
    # gender=models.CharField(verbose_name="性别",choices=(("female","女"),("male","男")),default="female")
    gender=models.IntegerField(verbose_name="性别",choices=GENDER_STATUS,default=0)
    address=models.CharField(max_length=100,default="",verbose_name="地址")
    QQnum=models.CharField(max_length=15,default="",verbose_name="QQ号码")
    mobile=models.CharField(max_length=11,verbose_name="手机号",null=True,blank=True)
    image=models.ImageField(upload_to="image",default="image/default.png", verbose_name="个人头像",max_length=100)

    class Meta:
        db_table="userprofile"
        verbose_name_plural="用户基本信息"
    def __str__(self):
        return self.username #在AbstractUser表中有

    # 获取用户未读消息数量
    def getmessagecount(self):
        from operation.models import UserMessage
        return UserMessage.objects.filter(user=self.id,Is_read=False).count()
#产生验证码表
class EmailVerifyRecode(models.Model):
    code=models.CharField(max_length=20,verbose_name="邮箱验证码")
    email=models.EmailField(max_length=50,verbose_name="邮箱")
    #根据类型设置验证码
    send_type=models.CharField(choices=(("register","注册"),("forget","找回密码")),max_length=10,verbose_name="验证码类型")
    send_time=models.DateTimeField(auto_now_add=True,verbose_name="发送时间")
    class Meta:
        db_table="emailverifycode"
        verbose_name_plural="邮箱验证码"
    def __str__(self):
        return "%s,%s" %(self.code,self.email)


#轮播图表(可以自己去增加修改打广告)
class Banner(models.Model):
    title=models.CharField(max_length=100,verbose_name="标题")
    image=models.ImageField(upload_to="banner",verbose_name="轮播图",max_length=100,default="banner/default.png")
    #轮播图关联的跳转地址
    url=models.URLField(max_length=200,verbose_name="访问地址")
    #控制轮播图顺序,小的在前面播放
    index=models.IntegerField(default=50,verbose_name="播放顺序")
    add_time=models.DateTimeField(auto_now=True,verbose_name="轮播添加时间")
    class Meta:
        db_table="banner"
        verbose_name_plural="轮播图"

