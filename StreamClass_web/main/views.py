from django.shortcuts import render, HttpResponse, redirect
from django.contrib.auth.models import User, Permission
from django.contrib.auth import authenticate
from django.contrib.auth import login as lg
from django.contrib.auth import logout as lgout
from django.contrib.auth.decorators import login_required
from django.contrib import messages

from rest_framework.response import Response
from rest_framework.permissions import AllowAny
from rest_framework.decorators import api_view, permission_classes


def cadastro(request):
    if request.method == 'GET':
        return render(request, 'main/cadastro.html')
    else:
        username = request.POST['username']
        fname = request.POST['fname']
        lname = request.POST['lname']
        data_nasc = request.POST['data_nasc']
        email = request.POST['email']
        password = request.POST['senha']
        password_confirm = request.POST.get('senha_confirm')

        user_email = User.objects.filter(email=email).first()
        user_username = User.objects.filter(username=username).first()

        if user_email:
            return HttpResponse('Email já cadastrado')
        elif user_username:
            return HttpResponse('Username já cadastrado')
        elif password_confirm != password:
            messages.error(request, 'As senhas devem ser iguais')
        else:
            user = User.objects.create_user(username=username, password=password, email=email)
            user.first_name = fname
            user.last_name = lname
            user.save()

            messages.success(request, 'Usuário cadastrado com sucesso')

            return redirect('login')


def login(request):
    if request.method == 'GET':
        return render(request, 'main/login.html')
    else:

        username = request.POST['username']
        password = request.POST['senha']

        user = authenticate(username=username, password=password)

        if user:
            lg(request, user)
            fname = user.first_name
            messages.success(request, 'Login realizado com sucesso')
            return render(request, 'main/home.html', {'fname': fname})
        else:
            messages.error(request, 'Senha incorreta ou usuário inexistente')
            return redirect('home')


# @login_required(login_url='/login/')
def home(request):
    return render(request, 'main/home.html')


def logout(request):
    lgout(request)
    messages.success(request, 'Logout realizado com sucesso')
    return redirect('home')

'''

@api_view(['GET'], )
@permission_classes([AllowAny], )
def login(request):
    print('Requisição OK!')
    return Response({'TESTE DE RESPOSTA'}, status=200)

def index(request):
    print('requisicao recebida')
    return HttpResponse('teste')


def imagem(request):
    return render(request, 'main/imagem.html')



def imagem(request):
    return render(request, 'main/imagem.html')
'''
