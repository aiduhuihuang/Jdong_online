import  random
from users.models import EmailVerifyRecode
from django.core.mail import send_mail
from OnlineStudy.settings import EMAIL_FROM

#随机生成邮箱验证码
def random_code(codelength=10):
    codestr=""
    chars="0123456789AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz"
    for i in range(codelength):
        codestr+=chars[random.randint(0,len(chars)-1)]
    return codestr

def send_register_email(email,urlhearder,send_type="register",):
    email_recode=EmailVerifyRecode()
    email_code=random_code(16)
    email_recode.email=email
    email_recode.code=email_code
    email_recode.send_type=send_type
    email_recode.save()
    #发送邮件
    email_titile=""
    email_message=""
    if send_type=="register":
        email_titile = "Jdong在线学习注册激活链接"
        email_message = "请点击下面的链接激活您的账号\n"+"   "+urlhearder+"/active/{0}".format(email_code)
        print(email_message)
        #需要在settings配置
        send_status=send_mail(email_titile,email_message,EMAIL_FROM,[email])
        if send_status:
            print("成功")
    elif send_type=="forget":
        email_titile = "Jdong在线学习找回密码链接"
        email_message = "请点击下面的链接重置您的密码\n" + "   " + urlhearder + "/reset/{0}".format(email_code)
        print(email_message)
        # 需要在settings配置
        send_status = send_mail(email_titile, email_message, EMAIL_FROM, [email])
        if send_status:
            print("找密码成功")
