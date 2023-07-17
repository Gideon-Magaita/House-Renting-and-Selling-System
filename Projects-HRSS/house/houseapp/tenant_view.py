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

#map imports
import folium
import geocoder

# Create your views here.

@login_required(login_url='login_user')
@allowed_users(allowed_roles=['tenant'])
def tenant_home(request):
    message = OwnerMessage.objects.filter(tenant_id=request.user.id).count()
    # status=['pending']
    house = House.objects.filter(status='pending').count()
    # house = House.objects.all().count()
    context={
        'message':message,
        'house':house,
    }

    return render(request,'tenant/home_tenant.html',context)


@login_required(login_url='login_user')
@allowed_users(allowed_roles=['tenant'])
def houses(request):
    status=['pending']
    house = House.objects.filter(status__in=status)
    return render(request,'tenant/house.html',{'house':house})

@login_required(login_url='login_user')
@allowed_users(allowed_roles=['tenant'])
def view_house(request,id):
    house = House.objects.get(id = id)
    return render(request,'tenant/view_house.html',{'house':house})



@login_required(login_url='login_user')
@allowed_users(allowed_roles=['tenant'])
def chatroom(request):
    # house = House.objects.get(id = id)
    message = Chatroom.objects.all()[:4]
    if request.method == 'POST':
        form = ChatroomForm(request.POST or None)
        if form.is_valid():
            form.save()
          
            messages.success(request,'message sent successfully')
        else:
            messages.success(request,'message not sent')

        if messages:
            return redirect('chatroom') 
    else:
        form = ChatroomForm()        
    return render(request,'tenant/chatroom.html',{'form':form,'message':message})



#chatting function
@login_required
def tenant_chat(request):

    tenchat = OwnerMessage.objects.filter(tenant_id=request.user.id).select_related('owner')
    
    if request.method=='POST':
        form = TenantMessageForm(request.POST or None)
        if form.is_valid():
            tenant=form.save(commit=False)
            tenant.tenant = request.user
            tenant.save()
            form.save_m2m()
            messages.success(request, 'Sent successful')
        else:
            messages.error(request, 'failed')
        return redirect('tenant_chat')
            
    else:
        form = TenantMessageForm()
        context={
            'form':form,
            'tenchat':tenchat,
        }
        return render(request,'tenant/chatroom.html',context)



#map function to display house location    
@login_required
def house_location(request):
    if request.method=='POST':
        form = House_locationForm(request.POST or None)
        if form.is_valid():   
            form.save()
            return redirect('house_location')
    else:
        form = House_locationForm()
    address = House_location.objects.all().last()   
    location = geocoder.osm(address)
    lat = location.lat
    lng = location.lng
    country = location.country
    if lat == None or lng == None:
        return HttpResponse(request,'You entered an invalid location')

    m = folium.Map(location=[19,-12], zoom_start=2)
    folium.Marker([lat, lng ],tooltip='Click for more',popup= country).add_to(m)
    m = m._repr_html_()
    context={
        'm':m,
        'form':form,
    }  
    return render(request,'tenant/location.html',context)
    
#feedbackfnction
@login_required
def feed(request):
    return render(request,'tenant/feedback.html')

@login_required
def ten_feedback(request):
    feedback =request.POST.get('feedback')
    feed_back = Feedback(feedback=feedback)
    feed_back.save()
    return JsonResponse({'success': True})

@login_required
def payment(request):
    agents = Agents.objects.all()
    context={
        'agents': agents,
    }
    return render(request,'tenant/payment.html',context)
        
   

        
        
   
      