from django.shortcuts import render,redirect
from django.http import HttpResponse,JsonResponse
from django.views.generic.base import View
from pure_pagination import Paginator,EmptyPage,PageNotAnInteger
from OnlineStudy.settings import Flag

from .models import CourseOrg,City,Teacher
from users.models import UserProfile
from operation.models import UserAsk,UserFavorite
from courses.models import Course
from django.db.models import Sum,Q
# import functools
# Create your views here.

class OrgListView(View):
    def get(self,request):
        Flag = 1
        id = request.session.get("id")
        user_obj = UserProfile.objects.filter(id=id).first()

        all_orgs=CourseOrg.objects.all()
        # 进行搜索功能
        search_keywords = request.GET.get("keywords", "")
        if search_keywords:
            all_orgs=CourseOrg.objects.filter(Q(name__icontains=search_keywords)
                                              |Q(description__icontains=search_keywords)).all()
        hot_orgs=all_orgs.order_by("-click_nums").all()[:5]
        all_city=City.objects.all()
        #根据学习人数和课程总数进行筛选
        #获取sort==students学习人数
        s_stu=request.GET.get("sort")
        if s_stu=="students":
            all_orgs=all_orgs.order_by("-students").all()
        elif s_stu=="courses":
            all_orgs = all_orgs.order_by("-course_nums").all()
        else:
            all_orgs=all_orgs.order_by("-click_nums").all()
        #进行机构类别和所在地区条件筛选
        city = request.GET.get("city", "")
        # city_id= int(city) if city else 0  #三目运算
        city_id=city
        ct=request.GET.get("ct","")
        if city and ct:
            all_orgs=all_orgs.filter(city_id=int(city),category=ct).all()
        else:
                if ct=="" and city:
                    all_orgs=all_orgs.filter(city_id=int(city)).all()
                elif city==""and ct:
                    all_orgs = all_orgs.filter(category=ct).all()
                else:
                    all_orgs = all_orgs


        #分页-利用django的pure-pagination
        try:
            page=request.GET.get("page",1)
        except PageNotAnInteger:
            page=1
        p=Paginator(all_orgs,5,request=request)#数据集，每页5条数据
        orgs=p.page(page)#第几页,自动实现跳转第几页
        return render(request,"org-list.html",locals())


class AddaskView(View):
    def get(self,request):
        return HttpResponse("增加")
    def post(self,request):
        print(request.POST)
        name=request.POST.get("name")
        tel = request.POST.get("tel")
        cour = request.POST.get("cour")
        if name and cour and tel:
            if len(tel)==11:
                #写入数据库
                u_ask=UserAsk()
                u_ask.name=name
                u_ask.mobile=tel
                u_ask.course_name=cour
                try:
                    u_ask.save()
                    message="数据提交成功"
                except:
                    message="咨询数据提交失败"
            else:
                message="输入合法的电话"
        else:
            message="姓名/课程/电话不能为空"
        return HttpResponse(message)

#机构首页
class OrgHomeView(View):
    def get(self,request,org_id=1):
        current_page="home" #判断机构首页左边导航条是否选中
        id=request.session.get("id")
        if id:
            user_obj=UserProfile.objects.filter(id=int(str(id))).first()
            course_org=CourseOrg.objects.filter(id=int(org_id)).first()
            course_org.click_nums+=1
            course_org.save() #点击率加1
            # course_obj=Course.objects.filter(courseorg_id=org_id).all()[:3]
            course_obj=course_org.course_set.all()[:3]
            teacher_obj=Teacher.objects.filter(courseorg_id=int(org_id)).all()[:2]
            # 查看机构是否已经收藏
            user_fav = UserFavorite.objects.filter(fav_type=2, user_id=id, fav_id=int(org_id)).first()
            return render(request,"org-detail-homepage.html",locals())
        else:
            return redirect("/login/")

#机构课程页面
class OrgCourseView(View):
    def get(self,request,org_id):
        current_page = "course"
        id = request.session.get("id")
        user_obj = UserProfile.objects.filter(id=int(id)).first()
        course_org = CourseOrg.objects.filter(id=org_id).first()
        return render(request,"org-detail-course.html",locals())

#机构介绍页面
class OrgDescView(View):
    def get(self,request,org_id):
        current_page = "desc"
        id = request.session.get("id")
        user_obj = UserProfile.objects.filter(id=int(id)).first()
        course_org = CourseOrg.objects.filter(id=org_id).first()
        return render(request,"org-detail-desc.html",locals())

#机构教师页面
class OrgTeacherView(View):
    def get(self,request,org_id=1):
        current_page="teacher"
        id = request.session.get("id")
        user_obj = UserProfile.objects.filter(id=int(id)).first()
        course_org=CourseOrg.objects.filter(id=org_id).first()
        teacher_obj=course_org.teacher_set.all()
        return render(request,"org-detail-teachers.html",locals())

#增加收藏（利用ajax），也要根据判断在不同的收藏数量上加1或者减1
class AddFavView(View):
    def get(self,request):
        id = request.session.get("id")
        user_obj = UserProfile.objects.filter(id=int(id)).first()
        return HttpResponse("sss")
    def post(self,request):
        result={
            "code":10000,
            "message":"",
            "status":""
        }
        id=request.session.get("id")
        fav_id=request.POST.get("fav_id")
        fav_type=request.POST.get("fav_type")
        if fav_id and fav_type:
            if id:
                fav_obj=UserFavorite.objects.filter(user_id=int(id),fav_type=fav_type,fav_id=fav_id).first()
                if fav_obj:
                    fav_obj.delete()
                    result["message"]="取消收藏成功"
                    result["status"]="0"
                    result["code"]=10003
                else:
                    fav_obj=UserFavorite()
                    fav_obj.fav_id=int(fav_id)
                    fav_obj.fav_type=fav_type
                    fav_obj.user_id=int(id)
                    fav_obj.save()
                    result["message"]="收藏成功"
                    result["code"]=10000
                    result["status"] = "1"
            else:
                result["message"] = "请您先进行登录才能收藏"
                result["code"] = 10002
                result["status"] = "2"
        else:
            result["message"] = "无法获取到数据"
            result["code"] = 10004
            result["status"] = "3"
        return  JsonResponse(result)

#讲师首页
class TeacherListView(View):
    def get(self,request):
        Flag=4
        id=request.session.get("id")
        if id:
            user_obj=UserProfile.objects.filter(id=int(id)).first()
            sort=request.GET.get("sort","")
            if sort == "hot":
                teacher_obj=Teacher.objects.order_by("-click_nums").all()#按照点击数
            else:
                teacher_obj=Teacher.objects.order_by("-work_years").all()#按照工作年限
            #排名取六个
            order_teacher=teacher_obj.order_by("-fav_nums").all()
            #分页极速
            try:
                page=request.GET.get("page",1)
            except PageNotAnInteger:
                page=1
            p=Paginator(teacher_obj,5,request=request)#数据集，每页5条数据
            teachers=p.page(page)#第几页,自动实现跳转第几页
            return  render(request,"teachers-list.html",locals())
        else:
            return  redirect("/login/")

#讲师详情页
class TeacherDetailView(View):
    def get(self,request,teacher_id):
        Flag=4
        id=request.session.get("id")
        if id:
            user_obj=UserProfile.objects.filter(id=int(id)).first()
            teacher_obj=Teacher.objects.order_by("-click_nums").all()[:5]#讲师排行榜
            t_detail_obj=Teacher.objects.filter(id=int(teacher_id)).first()
            t_detail_obj.click_nums+=1#点击数加1
            t_detail_obj.save()
            #机构
            org_obj=t_detail_obj.courseorg
            #课程列表
            course_obj=t_detail_obj.course_set.all()[:3]
            #判断是否讲师和机构是否收藏
            org_fav=UserFavorite.objects.filter(user_id=int(id),fav_type=2,fav_id=org_obj.id).first()
            t_fav=UserFavorite.objects.filter(user_id=int(id),fav_type=3,fav_id=t_detail_obj.id).first()
            if t_detail_obj:
                return render(request,"teacher-detail.html",locals())
        else:
            return redirect("/login/")