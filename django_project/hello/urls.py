from django.contrib import admin
from django.urls import path,include
from django.http import HttpResponse
from . import views
urlpatterns = [
    path('',views.hello_world,name='hello.views.hello_world'),
    path('goodbye/',views.goodbye_world,name='hello.views.goodbye_world')
]
