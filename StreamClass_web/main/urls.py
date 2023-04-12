from django.urls import path

from main.views import *

# from main.views import index, imagem


urlpatterns = [
    path('login/', login, name='login'),
    path('logout/', logout, name='logout'),
    path('cadastro/', cadastro, name='cadastro'),
    path('home/', home, name='home')
]

