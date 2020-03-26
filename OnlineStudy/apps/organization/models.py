from django.db import models
from DjangoUeditor.models import UEditorField

# Create your models here.

CATEGORY_STATUS=(("pxjg","培训机构"),("gx","高校"),("gr","个人"))
#城市表
class City(models.Model):
    name=models.CharField(max_length=20,verbose_name="城市")
    description=models.CharField(max_length=200,verbose_name="描述",null=True,blank=True)
    add_time=models.DateTimeField(auto_now=True,verbose_name="添加时间")
    class Meta:
        db_table="city"
        verbose_name_plural="城市"
    def __str__(self):
        return  self.name
#机构信息
class CourseOrg(models.Model):
    name=models.CharField(max_length=50,verbose_name="机构名称")
    description=models.TextField(verbose_name="机构描述",null=True,blank=True)
    #imagePath图片上传路径,filePath文件路径
    detail = UEditorField(verbose_name='课程详情', width=600, height=300, imagePath="course/ueditor/",
                          filePath="course/ueditor/", default='',null=True,blank=True)
    category=models.CharField(max_length=20,choices=CATEGORY_STATUS,verbose_name="机构类别",default="pxjg")
    click_nums=models.IntegerField(default=0,verbose_name="点击数")
    fav_nums=models.IntegerField(default=0,verbose_name="收藏数")
    image=models.ImageField(upload_to="organ",verbose_name="机构封面图",max_length=100,default="organ/default.png")
    address=models.CharField(max_length=150,verbose_name="机构地址")
    city=models.ForeignKey(to="City",to_field="id",on_delete=models.CASCADE,verbose_name="所在城市")
    students=models.IntegerField(default=0,verbose_name="学习人数")
    course_nums=models.IntegerField(default=0,verbose_name="课程数")
    add_time = models.DateTimeField(auto_now=True, verbose_name="添加时间")
    class Meta:
        db_table="courseorg"
        verbose_name_plural="机构"
    def __str__(self):
        return self.name

GENDER_STATUS=((0,"女"),(1,"男"))
#机构教师表（后期可能有更详细的信息）
class Teacher(models.Model):
    courseorg=models.ForeignKey(to="CourseOrg",to_field="id",on_delete=models.CASCADE,verbose_name="所属机构")
    name=models.CharField(max_length=20,verbose_name="教师名")
    image = models.ImageField(upload_to="teacher", verbose_name="教师头像", max_length=100, default="teacher/default.png")
    work_years = models.IntegerField(default=0, verbose_name="工作年限")
    work_company=models.CharField(max_length=50,verbose_name="就职公司")
    work_positon = models.CharField(max_length=50, verbose_name="职位")
    age=models.IntegerField(verbose_name="年龄",default=0)
    gender = models.IntegerField(verbose_name="性别", choices=GENDER_STATUS, default=0)
    points = models.CharField(max_length=50, verbose_name="教学特点")
    tdetail=models.TextField(verbose_name="教师详细信息",null=True,blank=True)
    click_nums = models.IntegerField(default=0, verbose_name="点击数")
    fav_nums = models.IntegerField(default=0, verbose_name="收藏数")
    add_time = models.DateTimeField(auto_now=True, verbose_name="添加时间")
    class Meta:
        db_table="teacher"
        verbose_name_plural="教师"
    def __str__(self):
        return  "%s(%s)"%(self.name,self.courseorg)