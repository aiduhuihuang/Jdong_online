# Generated by Django 2.2.1 on 2020-03-25 22:28

import DjangoUeditor.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='courseorg',
            name='detail',
            field=DjangoUeditor.models.UEditorField(blank=True, default='', null=True, verbose_name='课程详情'),
        ),
        migrations.AlterField(
            model_name='courseorg',
            name='description',
            field=models.TextField(blank=True, null=True, verbose_name='机构描述'),
        ),
    ]