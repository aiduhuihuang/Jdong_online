#用表单类实现每一个输入框的提示
from django import forms
#生成验证码库
from captcha.fields import CaptchaField


class RegisterForm(forms.Form):
    email=forms.EmailField(required=True)
    password = forms.CharField(required=True, min_length=6)
    captcha = CaptchaField(error_messages={"invalid":"验证码错误"})


class LoginForm(forms.Form):
    username=forms.CharField(required=True)
    password=forms.CharField(required=True,min_length=6)


class ForgetForm(forms.Form):
    email=forms.CharField(required=True)
    captcha = CaptchaField(error_messages={"invalid":"验证码错误"})


class ResetForm(forms.Form):
    password=forms.CharField(required=True,min_length=6,max_length=20)
    npassword=forms.CharField(required=True,min_length=6,max_length=20)