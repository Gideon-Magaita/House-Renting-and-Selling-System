from django.shortcuts import render,redirect
from .models import *
from .forms import *
from django.contrib import messages
from django.shortcuts import HttpResponse
from django.db.models import Q
from django.http import JsonResponse


#authentication imports
from django.contrib.auth.models import Group
from django.contrib.auth.forms  import UserCreationForm
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from .decorators import unauthenticated_user,allowed_users,admin_only


@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin'])
def home_admin(request):
    house = House.objects.all().count()
    cat = HouseType.objects.all().count()
    feed = Feedback.objects.all().count()
    context={
        'house': house,
        'cat': cat,
        'feed': feed,
    }
    return render(request, 'admins/home_admin.html',context)




@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin'])
def category(request):
    categories=HouseType.objects.all()
    if request.method == 'POST':
        form = HouseTypeForm(request.POST or None)
        if form.is_valid():
            form.save()
            messages.success(request,'house category added successfully')
            return redirect('category')
    else:
        form = HouseTypeForm()
    context={
        'form':form,
        'categories':categories,
    }
    return render(request, 'admins/category.html',context)
        
@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin']) 
def user_feedbacks(request):
    feeds = Feedback.objects.all()
    context={
        'feeds':feeds,
    }
    return render(request, 'admins/feedback.html',context)



@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin']) 
def delete_cat(request,id):
    deli_cat = HouseType.objects.get(id=id)
    if True:
     deli_cat.delete()
     messages.success(request,'House category deleted!!')
    else:
     messages.error(request,'Something went wrong')
    return redirect('category')



@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin']) 
def edit_cat(request,id):
   cat = HouseType.objects.get(id=id)    
   form = HouseTypeForm(request.POST or None, instance=cat)
   if form.is_valid():
        form.save()
        messages.success(request,'house category updated!!')
        return redirect('category')
   context = {
      'form': form,
      }
   return render(request, 'admins/edit-cat.html',context)


@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin']) 
def house_view(request):
   house = House.objects.all()
   context = {
      'house': house,
   }
   return render(request, 'admins/houses.html',context)

@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin']) 
def agent(request):
   agents = Agents.objects.all()
   if request.method == 'POST':
      form = AgentsForm(request.POST or None, request.FILES or None)
      if form.is_valid():
         form.save()
         messages.success(request,'payment agent added successfully')
      else:
         messages.error(request,'failed to add agent')
      return redirect('agent')
   else:
      form = AgentsForm()
   context={
      'form': form,
      'agents':agents,
   }
   return render(request, 'admins/agents.html',context)


@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin']) 
def edit_agent(request,id):
   agent = Agents.objects.get(id=id)    
   form = AgentsForm(request.POST or None, instance=agent)
   if form.is_valid():
        form.save()
        messages.success(request,'payment agent updated!!')
        return redirect('agent')
   context = {
      'form': form,
      }
   return render(request, 'admins/edit-agent.html',context)

   
      