from django.shortcuts import render,redirect
from .models import *
from .forms import *
from django.contrib import messages
from django.db.models import Count
from django.db.models import Q
from django.http import JsonResponse
#authentication imports
from django.contrib.auth.models import Group
from django.contrib.auth.forms  import UserCreationForm
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from .decorators import unauthenticated_user,allowed_users,admin_only

#authentication imports

# Create your views here.

#authentication
@unauthenticated_user
def login_user(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username,password=password)

        if user is not None:
            login(request, user)
            return redirect('home')
        else:
            messages.info(request,'username or password is incorrect') 

    return render(request,'authentication/login.html')


def logoutUser(request):
    logout(request)
    return redirect('login_user')



@unauthenticated_user
def register(request):
    form = CreateUserForm()
    if request.method == 'POST':
        form = CreateUserForm(request.POST)
        if form.is_valid():
            user=form.save()
            group_choice = form.cleaned_data.get('group')
            group = Group.objects.get(name=group_choice)
            group.user_set.add(user)

            messages.success(request, 'Account was created')
            return redirect('login_user')
    else:
        form = CreateUserForm()    
    return render(request,'authentication/register.html',{'form':form})


#authentication
@login_required(login_url='login_user')
@admin_only
def home(request):

    message = TenantMessage.objects.filter(owner_id=request.user.id).count()
   
    house = House.objects.filter(user_id=request.user.id).count()

    feed = Feedback.objects.all().count()
    
    # rooms = House.rooms.count()
    context={
        'house': house,
        'message':message,
        'feed':feed, 
        }
    
    return render(request,'pages/home.html',context)


@admin_only
@allowed_users(allowed_roles=['House Owner'])
def description(request):
    house = House.objects.filter(user_id=request.user.id)

    print(house)

    if request.method == 'POST':
        form = HouseForm(request.POST or None, request.FILES or None)
        if form.is_valid():
            #add house details by checking the logged in user and retrieving data
            add_house = form.save(commit=False)
            add_house.user = request.user
            add_house.save()
            messages.success(request, "House details added successfully!")
        else:
            messages.error(request, "There is something wrong in your inputs!")

            return redirect('description')
    else:
        form = HouseForm()
    return render(request,'pages/description.html',{'form':form,'house':house})

@admin_only
def view_nyumba(request,id):
    nyumba = House.objects.get(id=id)
    return render(request,'pages/view_house.html',{'nyumba':nyumba})
    

@admin_only
def delete_des(request, id):
    house = House.objects.get(id=id)
    house.delete()
    if True:
     messages.success(request, "House deleted successfully!")
    else:
     messages.success(request, "something went wrong!")
    return redirect('description')


@admin_only
def update_description(request, id):

    house = House.objects.get(id=id)

    form = HouseForm(request.POST or None, request.FILES or None,instance=house)
    if form.is_valid():
        form.save()
        messages.success(request,('House details updated successfully'))
        return redirect('description')
    return render(request,'pages/update_description.html',{'form':form})


#feedback function
# @login_required
# def feedback_view(request):
#     return render(request,'pages/feedback.html')


@login_required
def my_feedback(request):
    if request.method == 'POST':
        form = FeedbackForm(request.POST)
        if form.is_valid():
            form.save()
            if request.is_ajax():
                return JsonResponse({'success': True})
            else:
                return redirect('my_feedback')
    else:
        form = FeedbackForm()
    return render(request, 'pages/feedback.html', {'form': form})
#end feedback function


def notification(request):
    return render(request,'pages/notifications.html')

#chatting function
@login_required
def chat(request):
    return render(request, 'pages/chat.html')



#chatting function
@login_required
def chat(request):

    message = TenantMessage.objects.filter(owner_id=request.user.id).select_related('tenant')

    if request.method=='POST':
        form = OwnerMessageForm(request.POST or None)
        if form.is_valid():
            tenant=form.save(commit=False)
            tenant.owner = request.user
            tenant.save()
            form.save_m2m()
            return redirect('chat')
    else:
        form = OwnerMessageForm()
        context={
            'form':form,
            'message':message,
        }
        return render(request,'pages/chat.html',context)
