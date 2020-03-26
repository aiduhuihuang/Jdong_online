from django.db import models

# Create your models here.

DEGREE_STATUS=(("cj","初级"),("zj","中级"),("gj","高级"))
class CourseType(models.Model):
    name=models.CharField(max_length=50,verbose_name="课类别")
    description=models.CharField(max_length=200,verbose_name="类别描述",null=True,blank=True)
    class Meta:
        db_table="coursetype"
        verbose_name_plural="课程类别"
    def __str__(self):
        return self.name
#课程表
class Course(models.Model):
    name=models.CharField(max_length=50,verbose_name="课程名")
    catory=models.ForeignKey(to="CourseType",to_field="id",on_delete=models.CASCADE,verbose_name="课类别")
    courseorg=models.ForeignKey(to="organization.CourseOrg",to_field="id",on_delete=models.CASCADE,verbose_name="机构")
    teacher=models.ForeignKey(to="organization.Teacher",to_field="id",on_delete=models.CASCADE,verbose_name="教师")
    desription=models.CharField(max_length=400,verbose_name="课程描述")
    detail=models.TextField(verbose_name="课程详情")
    is_banner=models.BooleanField(default=False,verbose_name="是否轮播")
    degree=models.CharField(choices=DEGREE_STATUS,verbose_name="课程难度",max_length=6)
    learn_times=models.IntegerField(default=0,verbose_name="学习时长/分钟")
    students=models.IntegerField(default=0,verbose_name="学习人数")
    fav_nums=models.IntegerField(default=0,verbose_name="收藏人数")
    image=models.ImageField(upload_to="course",verbose_name="课程封面图",max_length=100,default="course/default.png")
    tag=models.CharField(default="",verbose_name="课程标签",max_length=100)
    click_total=models.IntegerField(default=0,verbose_name="课程总点击数")
    add_time=models.DateTimeField(auto_now=True,verbose_name="课程添加时间")
    need_know=models.CharField(max_length=300,verbose_name="课程须知")
    teacher_tell=models.CharField(max_length=300,verbose_name="老师告诉你")
    class Meta:
        db_table="course"
        verbose_name_plural="课程"
    def __str__(self):
        return "%s(%s)"%(self.name,self.courseorg)
    def go_to(self):
        from django.utils.safestring import mark_safe
        return mark_safe("<a href='http://www.baidu.com'> 跳转测试</a>")
    go_to.short_description="跳转测试"

#课程的章节表(一对多)
class Lesson(models.Model):
    course=models.ForeignKey(to="Course",to_field="id",on_delete=models.CASCADE,verbose_name="课程")
    name=models.CharField(max_length=100,verbose_name="章节名")
    desription=models.CharField(max_length=400,verbose_name="章节内容介绍",null=True,blank=True)
    add_time=models.DateTimeField(auto_now=True,verbose_name="添加时间")
    class Meta:
        db_table="lesson"
        verbose_name_plural="章节信息"
    def __str__(self):
        return "%s(%s)" %(self.name,self.course)

#实现一张表用某一个字段分成两张表来管理，然后在adminx文件中进行注册
class BannerCourse(Course):
    class Meta:
        verbose_name_plural="轮播课程"
        proxy=True#关键设置 ，设置了它为True在注册时不会在重新生产一张表


#章节的视频表(章节一对多关系)
class Video(models.Model):
    #to_field关联字段,可以不写，默认为id
    lesson=models.ForeignKey(to="Lesson",to_field="id",on_delete=models.CASCADE,verbose_name="章节")
    name = models.CharField(max_length=100, verbose_name="视频名")
    pathaddress = models.CharField(verbose_name="播放地址",default="",max_length=300)
    learn_time = models.IntegerField(default=0, verbose_name="学习时长/分钟")
    desription = models.CharField(max_length=400, verbose_name="视频内容介绍", null=True, blank=True)
    add_time = models.DateTimeField(auto_now=True, verbose_name="添加时间")
    class Meta:
        db_table="video"
        verbose_name_plural="章节视频"
    def __str__(self):
        return self.name

#资源表
class CourseResource(models.Model):
    course=models.ForeignKey(to="Course",to_field="id",on_delete=models.CASCADE,verbose_name="课程")
    name = models.CharField(max_length=100, verbose_name="视频名")
    download = models.FileField(upload_to="up_file/resource", verbose_name="课程资源文件",max_length=100)
    download_num=models.IntegerField(default=0,verbose_name="下载次数")
    add_time = models.DateTimeField(auto_now=True, verbose_name="添加时间")
    class Meta:
        db_table="courseresource"
        verbose_name_plural="课程资源文件"


