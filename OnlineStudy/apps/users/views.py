from django.shortcuts import render,redirect,render_to_response
from django.http import HttpResponseRedirect,HttpResponse
from pure_pagination import Paginator,EmptyPage,PageNotAnInteger
import os
#利用系统自带的方法判断是否存在然后登录
from django.contrib.auth import authenticate,login as s_login
#实现自定义登录需要的包
from django.contrib.auth.backends import ModelBackend
from .models import UserProfile,EmailVerifyRecode,Banner
from operation.models import UserCourse,UserFavorite,UserMessage
from courses.models import Course
from organization.models import CourseOrg,Teacher
from django.db.models import Q
from .forms import LoginForm,RegisterForm,ForgetForm,ResetForm
#实现发邮件的
from utils.email_send import send_register_email
import datetime
#实现登录基于类的方法包
from django.views.generic.base import View
from django.contrib.auth.hashers import make_password #后台加密用到的函数
from OnlineStudy.settings import Flag,MEDIA_ROOT

#实现邮箱和用户名登录
class CustomBackend(ModelBackend):
    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            user_obj=UserProfile.objects.get(Q(username=username)|Q(email=username))
            if user_obj.check_password(password):
                return user_obj
        except:
            return None
# Create your views here.
#邮箱激活
class EmailActive(View):
    def get(self,request,active):#如果要设置过时，name就要删除这个表中这条记录和删除之前写进去的用户
        email_code=EmailVerifyRecode.objects.filter(code=active,send_type="register").order_by("-send_time").first()
        print(email_code)
        if email_code:
            user_obj=UserProfile.objects.filter(email=email_code.email).first()
            user_obj.is_active=1
            user_obj.save()
            return redirect("/login/",locals())
        else:
            message="邮箱验证码失效"
            return render(request,"EmailActive_fail.html",{"message":message})
#用户注册
class RegisterView(View):
    def get(self,request):
        register_form=RegisterForm()#取出验证码传值到页面
        return render(request, "register.html",locals())
    def post(self,request):
        register_form=RegisterForm(request.POST)
        if register_form.is_valid():#验证
            useremail = request.POST.get("email")
            password = request.POST.get("password")
            user=UserProfile.objects.filter(email=useremail).first()
            if user:
                return redirect("/register/",{"message":"邮箱已经注册了"})
            else:
                user_obj=UserProfile()
                user_obj.email=useremail
                user_obj.username=useremail
                user_obj.is_active=0 #初始没有激活，用户点击了邮件才激活
                user_obj.password=make_password(password)
                user_obj.save()
                #添加注册信息
                usermes=UserMessage()
                usermes.user=user_obj.id
                usermes.title="注册成功信息"
                usermes.message="欢迎您,成功注册Jdong在线网,请牢记密码"
                usermes.Is_read=False
                usermes.save()
                #发送邮件
                send_register_email(useremail,str(request.META.get("HTTP_ORIGIN")),"register")
                return redirect("/login/",locals())
        else:
            return render(request, "register.html",{"register_form":register_form})

#用户登录类
class LoginView(View):
    def get(self,request):
        return render(request, "login.html")
    def post(self,request):
        login_form=LoginForm(request.POST)
        if login_form.is_valid():#实现校验
            username = request.POST.get("username")
            password = request.POST.get("password")
            user_obj = authenticate(username=username, password=password)
            if user_obj:
                if user_obj.is_active:#判断是否激活
                    s_login(request, user_obj)
                    response = HttpResponse()
                    response.set_cookie("id", user_obj.id)
                    request.session["id"] = user_obj.id
                    return HttpResponseRedirect("/index/", locals())
                else:
                    message="用户注册没有在邮箱激活"
                    return render(request, "login.html", locals())
            else:
                message = "用户名/邮箱或密码错误"
                return render(request, "login.html", locals())
        else:
            login_msg=login_form#利用form表单进行长度和不为空判断
            return render(request, "login.html", locals())
"""
def login(request):
    if request.method=="POST":
        username=request.POST.get("username")
        password=request.POST.get("password")
        user=authenticate(username=username,password=password)
        if user:
            s_login(request,user)
            return render(request,"index.html",locals())
        else:
            message="用户名/邮箱或密码错误"
            return render(request,"login.html",locals())
    return render(request,"login.html",locals())
"""

#找回密码发邮件
class ForgetPwdView(View):
    def get(self,request):
        forget_form=ForgetForm()
        return render(request,"forgetpwd.html",{"forget_form":forget_form})
    def post(self,request):
        forget_form=ForgetForm(request.POST)
        if forget_form.is_valid():
            email=request.POST.get("email")
            #判断邮箱是否存在
            user_obj=UserProfile.objects.filter(email=email).first()
            if user_obj:
                send_register_email(email,str(request.META.get("HTTP_ORIGIN")),"forget")
                #返回页面
                message="邮箱发送成功,请到邮箱去重置密码"
                return render(request, "forgetpwd.html",{"message":message,"forget_form":forget_form})
            else:
                message="不存在邮箱,请检查邮箱"
                return render(request, "forgetpwd.html", {"message": message,"forget_form":forget_form})
        else:
            return render(request, "forgetpwd.html", {"forget_form": forget_form})
#找回密码页面
class ResetView(View):
    def get(self, request, reset):
        email_code = EmailVerifyRecode.objects.filter(code=reset,send_type="forget").order_by("-send_time").first()
        print(email_code)
        if email_code:
            email=email_code.email
            return render(request,"password_reset.html",{"email":email})
        else:
            message = "邮箱验证码失效"
            return render(request, "forgetpwd.html", {"message": message})
    def post(self,request,reset):
        reset_form=ResetForm(request.POST)
        email = request.POST.get("email")
        if reset_form.is_valid():
            pwd=request.POST.get("password")
            npwd=request.POST.get("npassword")
            if pwd!=npwd:
                return render(request,"password_reset.html",{"email":email,"message":"两次输入密码不一致"})
            else:
                user_obj=UserProfile.objects.get(email=email)
                user_obj.password=make_password(npwd)
                user_obj.save()
                #删除这条记录
                EmailVerifyRecode.objects.filter(email=email,code=reset,send_type="forget").delete()
                #设置session和cookie
                response=HttpResponse()
                response.set_cookie("id",user_obj.id)
                request.session["email"]=user_obj.id
                return redirect("/index/",locals())
        else:
            return render(request,"password_reset.html",{"email":email,"reset_form":reset_form})
#用户中心主页
class UserInfoView(View):
    def get(self,request):
        userFlag=1
        id =request.session.get("id")
        if id:
            user_obj=UserProfile.objects.filter(id=int(id)).first()

            return render(request,"usercenter-info.html",locals())
        else:
            return redirect("/login/")
    def post(self,request):
        id=request.session.get("id")
        try:
            user_obj=UserProfile.objects.filter(id=int(id)).first()
            if user_obj:
                nick_name=request.POST.get("nick_name")
                gender=request.POST.get("gender")
                address=request.POST.get("address")
                qqnum = request.POST.get("qqnum")
                mobile = request.POST.get("mobile")
                birth=request.POST.get("birday")
                if len(str(mobile))==11:
                    user_obj.nick_name=nick_name
                    user_obj.gender=int(gender)
                    user_obj.address=address
                    user_obj.QQnum=qqnum
                    user_obj.mobile=mobile
                    user_obj.birthday=birth
                    try:
                        user_obj.save()
                        print(id,nick_name,gender,address,qqnum,mobile)
                        return redirect("/users/info/")
                    except:
                        message = "修改数据失败,请检查"
                        return render(request, "usercenter-info.html", locals())
                else:
                    message="手机号必须是11位数字"
                    return render(request,"usercenter-info.html",locals())
            else:
                return  redirect("/login/")
        except:
            return redirect("/login/")

#用户的课程
class UserCoursInfoView(View):
    def get(self,request):
        userFlag=2
        id=request.session.get("id")
        user_obj=UserProfile.objects.filter(id=int(id)).first()
        if user_obj:
            mycourse=UserCourse.objects.filter(user_id=user_obj.id).order_by("-add_time").all()
            return render(request,"usercenter-mycourse.html",locals())
        else:
            return redirect("/login/")
#用户收藏
class UserFavoriteView(View):
    def get(self,request):
        userFlag=3
        id = request.session.get("id")
        user_obj = UserProfile.objects.filter(id=int(id)).first()
        if user_obj:
            user_fav=UserFavorite.objects.filter(user_id=int(id)).all()
            key = request.GET.get("key")
            list_obj=[]
            if key:
                if key == "org":
                    fav_type=2
                    #查出登录用户所有收藏的机构id
                    user_fav=user_fav.filter(fav_type=fav_type).all()
                    for user_fav_obj in user_fav:
                        org_obj=CourseOrg.objects.filter(id=user_fav_obj.fav_id).first()
                        list_obj.append(org_obj)
                    return render(request,"usercenter-fav-org.html",locals())
                if key =="teacher":
                    fav_type=3
                    # 查出登录用户所有收藏的讲师id
                    user_fav = user_fav.filter(fav_type=fav_type).all()
                    for user_fav_obj in user_fav:
                        org_obj = Teacher.objects.filter(id=user_fav_obj.fav_id).first()
                        list_obj.append(org_obj)
                    return render(request,"usercenter-fav-teacher.html",locals())
            else:
                fav_type=1
                # 查出登录用户所有收藏的机构id
                user_fav = user_fav.filter(fav_type=fav_type).all()
                for user_fav_obj in user_fav:
                    org_obj = Course.objects.filter(id=user_fav_obj.fav_id).first()
                    list_obj.append(org_obj)
                return render(request,"usercenter-fav-course.html",locals())
        else:

            return redirect("/login/")

#用户收藏中的删除 所有关于收藏的都要减1
class UserFav_DeleteView(View):
    def get(self,request):
        list_obj=None
        id=request.session.get("id")
        fav_type=request.GET.get("favtype")
        fav_id=request.GET.get("favid")
        if fav_type=="1":#代表课程
            list_obj = UserFavorite.objects.filter(fav_type=int(fav_type), user_id=int(id)).all()
            try:
                list_obj.filter(fav_id=int(fav_id)).delete()
                #这个课程的收藏数-1
                course_obj=Course.objects.filter(id=int(fav_id)).first()
                course_obj.fav_nums -=1
                course_obj.save()
            except:
                pass
            print(list_obj)
            return redirect("/users/favorite/", locals())
        if fav_type=="2":#代表机构
            list_obj = UserFavorite.objects.filter(fav_type=int(fav_type), user_id=int(id)).all()
            try:
                list_obj.filter(fav_id=int(fav_id)).delete()
                org_obj=CourseOrg.objects.filter(id=int(fav_id)).first()
                org_obj.fav_nums -=1
                org_obj.save()
            except:
                pass
            print(list_obj)
            return redirect("/users/favorite/?key=org", locals())
        if fav_type=="3":#代表讲师
            list_obj=UserFavorite.objects.filter(fav_type=int(fav_type),user_id=int(id)).all()
            try:
                list_obj.filter(fav_id=int(fav_id)).delete()
                teacher_obj=Teacher.objects.filter(id=int(fav_id)).first()
                teacher_obj.fav_nums -=1
                teacher_obj.save()
            except:
                pass
            print(list_obj)
            return redirect("/users/favorite/?key=teacher", locals())

#我的消息
class UserMessageView(View):
    def get(self,request):
        userFlag=4
        id=request.session.get("id")
        user_obj=UserProfile.objects.filter(id=int(id)).first()
        if user_obj:
            all_message=UserMessage.objects.filter(user=int(id)).all()
            all_message.update(Is_read=True)
            # 分页极速
            try:
                page = request.GET.get("page", 1)
            except PageNotAnInteger:
                page = 1
            p = Paginator(all_message, 8, request=request)  # 数据集，每页5条数据
            mes_obj = p.page(page)  # 第几页,自动实现跳转第几页
            return render(request,"usercenter-message.html",locals())
        else:
            redirect("/login/")

#用户上传头像
########
class UserImagesView(View):
    def post(self,request):
        id = request.session.get("id")
        user_obj=UserProfile.objects.filter(id=int(id)).first()
        img = request.FILES.get('img_file')
        name=request.POST.get("img_name")
        newname=str(name).split(".")[-1].lower()
        if newname=="jpg" or newname=="png" or newname=="bmp":
            url = MEDIA_ROOT + "/image/"
            print(url)
            # 判断目录是否存在，不存在创建，
            if os.path.isdir(url):
                pass
            else:
                print("目录不存在")
                os.mkdir(url)
            url = url+user_obj.email+name
            # 并且不是默认的就删除用户头像文件
            with open(url, 'wb') as f:
                for chunk in img.chunks():
                    f.write(chunk)
            #保存数据库
            user_obj = UserProfile.objects.filter(id=int(id)).first()
            user_obj.image ="image/"+user_obj.email+name
            user_obj.save()
            message = "头像修改成功"
            return HttpResponse("成功")
        else:
            message="头像修改失败"
            return HttpResponse(message)

#index页面
class IndexView(View):
    def get(self,request):
        Flag = 2
        id = request.session.get("id")
        if id:
            user_obj = UserProfile.objects.filter(id=int(id)).first()
        #取出轮播图
        banner_obj=Banner.objects.order_by("-index").all()[:5]
        #取出课程
        course_obj=Course.objects.filter(is_banner=False).all()[:6]
        ban_cour_obj=Course.objects.filter(is_banner=True).all()[:4]
        coursorg_obj=CourseOrg.objects.all()[:15]
        return render(request,"index.html",locals())




#主页
def index(request):
    Flag=2
    id=request.session.get("id")
    if id:
        user_obj=UserProfile.objects.filter(id=int(id)).first()
    return render(request,"index.html",locals())
#退出
def logout(request):
    response=HttpResponse("")
    response.delete_cookie("id")
    del request.session["id"]
    return redirect("/login/")
#页面找不到调用的
def page_not_found(request,exception):
    response=render_to_response("404.html")
    response.status_code=404
    return response

#页面找不到调用的
def server_error(request):
    response=render_to_response("500.html")
    response.status_code=500
    return response