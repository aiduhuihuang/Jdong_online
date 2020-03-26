from django.shortcuts import render,redirect
from django.views.generic.base import View
from django.http import HttpResponse,JsonResponse
from pure_pagination import Paginator,EmptyPage,PageNotAnInteger
from django.db.models import Q

from users.models import UserProfile
from operation.models import UserFavorite,CourseComments,UserCourse
from .models import Course,CourseResource,Video
# Create your views here.
class CourseListView(View):
    def get(self,request):
        Flag = 3
        id = request.session.get("id")
        user_obj = UserProfile.objects.filter(id=id).first()

        all_course=Course.objects.all()
        #进行搜索功能
        search_keywords=request.GET.get("keywords","")
        if search_keywords:
            all_course=Course.objects.filter(Q(name__icontains=search_keywords)
                                             |Q(tag__icontains=search_keywords)
                                             |Q(desription__icontains=search_keywords)).all()
        hot_course=all_course.order_by("-click_total").all()[:3]
        #根据最新和课程点击数以及学习人数进行筛选
        #获取sort==students学习人数
        s_stu=request.GET.get("sort")
        if s_stu=="students":
            all_course=all_course.order_by("-students").all()
        elif s_stu=="hot":
            all_course = all_course.order_by("-click_total").all()
        else:
            all_course=all_course.order_by("-add_time").all()

        #分页-利用django的pure-pagination
        try:
            page=request.GET.get("page",1)
        except PageNotAnInteger:
            page=1
        p=Paginator(all_course,12,request=request)#数据集，每页12条数据
        courses=p.page(page)#第几页,自动实现跳转第几页
        return render(request,"course-list.html",locals())
#课程详细信息（访问一次 点击量就+1）
class CourseDetailView(View):
    def get(self,request,course_id=1):
        Flag=3
        id = request.session.get("id")
        if id:
            user_obj = UserProfile.objects.filter(id=id).first()
            course_obj=Course.objects.filter(id=int(course_id)).first()
            #访问量+1
            course_obj.click_total+=1
            course_obj.save()
            #查看机构是否已经收藏
            user_fav=UserFavorite.objects.filter(fav_type=2,user_id=id,fav_id=course_obj.courseorg_id).first()
            print(user_fav)
            #查看课程是否已经收藏
            cour_fav=UserFavorite.objects.filter(fav_type=1,user_id=id,fav_id=course_id).first()
            #相关课程
            if course_obj.tag:
                tag_obj=Course.objects.filter(~Q(id=course_id)&Q(tag__icontains=course_obj.tag)).all()[:1]
            else:
                tag_obj=[]

            return render(request,"course-detail.html",locals())
        else:
            return redirect("/login/")

#课程的视频信息
class CoursVideoView(View):
    def get(self,request,course_id):
        Flag=3
        id=request.session.get("id")
        user_obj=UserProfile.objects.filter(id=id).first()
        if user_obj:
            #开始读取页面
            course_obj=Course.objects.filter(id=course_id).first()
            uc_obj=UserCourse.objects.filter(user_id=id,course_id=course_id).first()
            if uc_obj:
                pass #已经在学习
            else:
                u_course=UserCourse()
                u_course.user_id=id
                u_course.course_id=course_id
                u_course.save()
                #课程表学习人数加1
                course_obj.students+=1
                course_obj.save()
            #资源下载
            all_resource=CourseResource.objects.filter(course_id=course_id).all()
            if course_obj:
                #存在课程
                return render(request,"course-video.html",locals())
            else:
                return redirect("/course/list/",locals())
        else:
            return redirect("/login/")
#课程的评论信息
class CoursCommentView(View):
    def get(self,request,course_id):
        Flag = 3
        id = request.session.get("id")
        user_obj = UserProfile.objects.filter(id=id).first()
        if user_obj:
            # 开始读取页面
            course_obj = Course.objects.filter(id=course_id).first()
            # 资源下载
            all_resource = CourseResource.objects.filter(course_id=course_id).all()
            if course_obj:
                #评论
                comments=CourseComments.objects.filter(course_id=course_id).order_by("-add_time").all()
            else:
                return redirect("/course/list/", locals())
        else:
            return redirect("/login/")
        return render(request,"course-comment.html",locals())


#发表评论
class AddCommentView(View):
    def post(self,request):
        id=request.session.get("id")
        course_id=request.POST.get("course_id")
        comments=request.POST.get("comments")
        if id:
            comm=CourseComments()
            comm.course_id=course_id
            comm.user_id=id
            comm.comments=comments
            comm.save()
            message="发表成功"
            return  HttpResponse(message)
        else:
            return  redirect("/login/")

class VideoPlayView(View):
    def get(self,request):
        Flag = 3
        id = request.session.get("id")
        course_id=request.GET.get("course_id")
        lesson_id=request.GET.get("lesson_id")
        viid=request.GET.get("vi_id")
        user_obj = UserProfile.objects.filter(id=id).first()
        if user_obj:
            # 开始读取页面
            course_obj = Course.objects.filter(id=int(course_id)).first()
            print(course_obj.id)
            #####根据id和课程查询要播放的视频信息第几章的第几个视频
            video_play_obj=Video.objects.filter(id=viid).first()
            all_resource = CourseResource.objects.filter(course_id=course_obj.id).all()
            if course_obj:
                # 存在课程
                return render(request, "course_play.html", locals())
            else:
                return redirect("/course/list/", locals())
        else:
            return redirect("/login/")